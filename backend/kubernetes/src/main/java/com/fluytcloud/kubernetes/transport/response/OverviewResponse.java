package com.fluytcloud.kubernetes.transport.response;

import java.util.List;

public record OverviewResponse(
        List<OverviewChartResponse> pods,
        List<OverviewChartResponse> deployments,
        List<OverviewChartResponse> daemonSets,
        List<OverviewChartResponse> statefulSets,
        List<OverviewChartResponse> replicaSets,
        List<OverviewChartResponse> jobs,
        List<OverviewChartResponse> cronJobs
) {
}
