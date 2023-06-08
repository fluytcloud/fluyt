package com.fluytcloud.kubernetes.transport.http;

import com.fluytcloud.kubernetes.entities.Filter;
import com.fluytcloud.kubernetes.interactors.*;
import com.fluytcloud.kubernetes.transport.request.OverviewRequestFilter;
import com.fluytcloud.kubernetes.transport.response.OverviewChartResponse;
import com.fluytcloud.kubernetes.transport.response.OverviewResponse;
import io.kubernetes.client.openapi.models.*;
import io.quarkus.security.Authenticated;
import jakarta.validation.Valid;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.MediaType;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

import static java.util.Objects.isNull;
import static java.util.Objects.nonNull;

@Path("/api/v1/kubernetes/overview")
@Authenticated
@Consumes(MediaType.APPLICATION_JSON)
@Produces(MediaType.APPLICATION_JSON)
public class OverviewResource {

    private final PodService podService;
    private final DeploymentService deploymentService;
    private final ClusterService clusterService;
    private final DaemonSetService daemonSetService;
    private final StatefulSetService statefulSetService;
    private final ReplicaSetService replicaSetService;
    private final JobService jobService;
    private final CronJobService cronJobService;

    public OverviewResource(
            PodService podService,
            DeploymentService deploymentService,
            ClusterService clusterService,
            DaemonSetService daemonSetService,
            StatefulSetService statefulSetService,
            ReplicaSetService replicaSetService,
            JobService jobService,
            CronJobService cronJobService) {
        this.podService = podService;
        this.deploymentService = deploymentService;
        this.clusterService = clusterService;
        this.daemonSetService = daemonSetService;
        this.statefulSetService = statefulSetService;
        this.replicaSetService = replicaSetService;
        this.jobService = jobService;
        this.cronJobService = cronJobService;
    }

    @GET
    public OverviewResponse get(@BeanParam @Valid OverviewRequestFilter requestFilter) {
        var cluster = clusterService.findById(requestFilter.getClusterId())
                .orElseThrow();
        var filter = new Filter(cluster).setNamespaces(requestFilter.getNamespaces());

        return new OverviewResponse(
                getPods(filter),
                getDeployments(filter),
                getDaemonSets(filter),
                getStatefulSets(filter),
                getReplicaSets(filter),
                getJobs(filter),
                getCronJobs(filter)
        );
    }

    private List<OverviewChartResponse> getPods(Filter filter) {
        var pods = podService.list(filter);

        var running = pods.stream()
                .map(V1Pod::getStatus)
                .filter(Objects::nonNull)
                .filter(it -> "Running".equals(it.getPhase()))
                .filter(it -> nonNull(it.getContainerStatuses()))
                .filter(it -> it.getContainerStatuses().stream()
                        .allMatch(V1ContainerStatus::getReady))
                .count();

        var pending = pods.stream()
                .map(V1Pod::getStatus)
                .filter(Objects::nonNull)
                .filter(it -> "Running".equals(it.getPhase()))
                .filter(it -> nonNull(it.getContainerStatuses()))
                .filter(it -> it.getContainerStatuses().stream()
                        .allMatch(status -> !status.getReady()))
                .count();

        var charts = pods.stream()
                .filter(it -> nonNull(it.getStatus()))
                .filter(it -> nonNull(it.getStatus().getPhase()))
                .filter(it -> !"Running".equals(it.getStatus().getPhase()))
                .collect(Collectors.groupingBy(it -> it.getStatus().getPhase()))
                .entrySet()
                .stream()
                .map(it -> new OverviewChartResponse(
                        it.getKey(),
                        it.getValue().size()
                ))
                .toList();

        var list = new ArrayList<OverviewChartResponse>(charts.size() + 2);
        list.addAll(charts);

        list.add(new OverviewChartResponse("Running", running));
        list.add(new OverviewChartResponse("Pending", pending));
        return list;
    }

    private List<OverviewChartResponse> getDeployments(Filter filter) {
        var deployments = deploymentService.list(filter);

        var running = deployments.stream()
                .map(V1Deployment::getStatus)
                .filter(Objects::nonNull)
                .filter(it -> nonNull(it.getReadyReplicas()))
                .mapToInt(V1DeploymentStatus::getReadyReplicas)
                .count();

        var pending = deployments.stream()
                .map(V1Deployment::getStatus)
                .filter(Objects::nonNull)
                .filter(it -> nonNull(it.getUnavailableReplicas()))
                .mapToInt(V1DeploymentStatus::getUnavailableReplicas)
                .count();

        var chartRunning = new OverviewChartResponse("Running", running);
        var chartPending = new OverviewChartResponse("Pending", pending);
        return List.of(chartPending, chartRunning);
    }

    private List<OverviewChartResponse> getDaemonSets(Filter filter) {
        var daemonSets = daemonSetService.list(filter);

        var running = daemonSets.stream()
                .map(V1DaemonSet::getStatus)
                .filter(Objects::nonNull)
                .filter(it -> nonNull(it.getNumberAvailable()))
                .mapToInt(V1DaemonSetStatus::getNumberAvailable)
                .count();

        var pending = daemonSets.stream()
                .map(V1DaemonSet::getStatus)
                .filter(Objects::nonNull)
                .filter(it -> nonNull(it.getNumberUnavailable()))
                .mapToInt(V1DaemonSetStatus::getNumberUnavailable)
                .count();

        var chartRunning = new OverviewChartResponse("Running", running);
        var chartPending = new OverviewChartResponse("Pending", pending);
        return List.of(chartPending, chartRunning);
    }

    private List<OverviewChartResponse> getStatefulSets(Filter filter) {
        var statefulSets = statefulSetService.list(filter);

        var running = statefulSets.stream()
                .map(V1StatefulSet::getStatus)
                .filter(Objects::nonNull)
                .filter(it -> it.getReplicas().equals(it.getReadyReplicas()))
                .count();

        var pending = statefulSets.stream()
                .map(V1StatefulSet::getStatus)
                .filter(Objects::nonNull)
                .filter(it -> !it.getReplicas().equals(it.getReadyReplicas()))
                .count();

        var chartRunning = new OverviewChartResponse("Running", running);
        var chartPending = new OverviewChartResponse("Pending", pending);
        return List.of(chartPending, chartRunning);
    }

    private List<OverviewChartResponse> getReplicaSets(Filter filter) {
        var replicaSets = replicaSetService.list(filter);

        var running = replicaSets.stream()
                .map(V1ReplicaSet::getStatus)
                .filter(Objects::nonNull)
                .filter(it -> it.getReplicas().equals(it.getReadyReplicas()))
                .count();

        var pending = replicaSets.stream()
                .map(V1ReplicaSet::getStatus)
                .filter(Objects::nonNull)
                .filter(it -> !it.getReplicas().equals(it.getReadyReplicas()))
                .count();

        var chartRunning = new OverviewChartResponse("Running", running);
        var chartPending = new OverviewChartResponse("Pending", pending);
        return List.of(chartPending, chartRunning);
    }

    private List<OverviewChartResponse> getJobs(Filter filter) {
        var jobs = jobService.list(filter);

        var active = jobs.stream()
                .map(V1Job::getStatus)
                .filter(Objects::nonNull)
                .filter(it -> nonNull(it.getActive()))
                .mapToInt(V1JobStatus::getActive)
                .sum();

        var failed = jobs.stream()
                .map(V1Job::getStatus)
                .filter(Objects::nonNull)
                .filter(it -> nonNull(it.getFailed()))
                .mapToInt(V1JobStatus::getFailed)
                .sum();

        var succeeded = jobs.stream()
                .map(V1Job::getStatus)
                .filter(Objects::nonNull)
                .filter(it -> nonNull(it.getSucceeded()))
                .mapToInt(V1JobStatus::getSucceeded)
                .sum();

        var chartActive = new OverviewChartResponse("Active", active);
        var chartFailed = new OverviewChartResponse("Failed", failed);
        var chartSucceeded = new OverviewChartResponse("Succeeded", succeeded);
        return List.of(chartActive, chartFailed, chartSucceeded);
    }

    private List<OverviewChartResponse> getCronJobs(Filter filter) {
        var cronJobs = cronJobService.list(filter);

        var scheduled = cronJobs.stream()
                .map(V1CronJob::getStatus)
                .filter(Objects::nonNull)
                .filter(it -> isNull(it.getActive()))
                .count();

        var active = cronJobs.stream()
                .map(V1CronJob::getStatus)
                .filter(Objects::nonNull)
                .filter(it -> nonNull(it.getActive()))
                .count();

        var chartScheduled = new OverviewChartResponse("Scheduled", scheduled);
        var chartActive = new OverviewChartResponse("Active", active);
        return List.of(chartScheduled, chartActive);
    }


}
