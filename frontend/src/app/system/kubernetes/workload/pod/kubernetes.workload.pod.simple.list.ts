export interface KubernetesWorkloadPodSimpleList {
  namespace: string;
  name: string;
  nodeName: string;
  runningContainers: number;
  containers: number;
  cpu: string;
  memory: string;
  status: string;
}
