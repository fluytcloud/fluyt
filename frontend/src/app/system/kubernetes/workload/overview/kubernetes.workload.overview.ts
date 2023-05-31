import {KubernetesWorkloadOverviewChart} from "./kubernetes.workload.overview.chart";

export interface KubernetesWorkloadOverview {
  pods: KubernetesWorkloadOverviewChart[];
  deployments: KubernetesWorkloadOverviewChart[];
  daemonSets: KubernetesWorkloadOverviewChart[];
  statefulSets: KubernetesWorkloadOverviewChart[];
  replicaSets: KubernetesWorkloadOverviewChart[];
  jobs: KubernetesWorkloadOverviewChart[];
  cronJobs: KubernetesWorkloadOverviewChart[];
}
