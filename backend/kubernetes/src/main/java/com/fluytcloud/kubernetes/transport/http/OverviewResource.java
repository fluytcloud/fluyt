package com.fluytcloud.kubernetes.transport.http;

import com.fluytcloud.kubernetes.entities.Filter;
import com.fluytcloud.kubernetes.interactors.ClusterService;
import com.fluytcloud.kubernetes.interactors.DeploymentService;
import com.fluytcloud.kubernetes.interactors.PodService;
import com.fluytcloud.kubernetes.transport.request.OverviewRequestFilter;
import com.fluytcloud.kubernetes.transport.response.OverviewChartResponse;
import com.fluytcloud.kubernetes.transport.response.OverviewResponse;
import io.kubernetes.client.openapi.models.V1DeploymentCondition;
import io.quarkus.security.Authenticated;
import jakarta.validation.Valid;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.MediaType;

import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

import static java.util.Objects.nonNull;

@Path("/api/v1/kubernetes/overview")
@Authenticated
@Consumes(MediaType.APPLICATION_JSON)
@Produces(MediaType.APPLICATION_JSON)
public class OverviewResource {

    private final PodService podService;
    private final DeploymentService deploymentService;
    private final ClusterService clusterService;

    public OverviewResource(
            PodService podService,
            DeploymentService deploymentService,
            ClusterService clusterService) {
        this.podService = podService;
        this.deploymentService = deploymentService;
        this.clusterService = clusterService;
    }

    @GET
    public OverviewResponse get(@BeanParam @Valid OverviewRequestFilter requestFilter) {
        var cluster = clusterService.findById(requestFilter.getClusterId())
                .orElseThrow();
        var filter = new Filter(cluster).setNamespaces(requestFilter.getNamespaces());

        return new OverviewResponse(
                getPods(filter),
                getDeployments(filter),
                null,
                null,
                null,
                null,
                null
        );
    }

    private List<OverviewChartResponse> getPods(Filter filter) {
        var pods = podService.list(filter);
        return pods.stream()
                .filter(it -> nonNull(it.getStatus()) && nonNull(it.getStatus().getPhase()))
                .collect(Collectors.groupingBy(it -> it.getStatus().getPhase()))
                .entrySet()
                .stream()
                .map(it -> new OverviewChartResponse(
                        it.getKey(),
                        it.getValue().size()
                ))
                .toList();
    }

    private List<OverviewChartResponse> getDeployments(Filter filter) {
        var deployments = deploymentService.list(filter);
        return deployments.stream()
                .filter(it -> nonNull(it.getStatus()) && nonNull(it.getStatus().getConditions()))
                .collect(Collectors.groupingBy(it -> it.getStatus().getConditions()
                        .stream()
                        .filter(condition -> nonNull(condition.getLastUpdateTime()))
                        .max(Comparator.comparing(V1DeploymentCondition::getLastUpdateTime))
                        .orElseGet(() -> it.getStatus().getConditions().get(0))
                        .getStatus()
                ))
                .entrySet()
                .stream()
                .map(it -> new OverviewChartResponse(
                        it.getKey(),
                        it.getValue().size()
                ))
                .toList();
    }

}
