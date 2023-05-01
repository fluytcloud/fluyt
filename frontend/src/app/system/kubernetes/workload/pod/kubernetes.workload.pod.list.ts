import {KubernetesWorkloadPodContainerList} from "./kubernetes.workload.pod.container.list";

export interface KubernetesWorkloadPodList {
  namespace: string,
  name: string
  restarts: number;
  nodeName: string;
  qosClass: string;
  age: string;
  status: string;
  containers: KubernetesWorkloadPodContainerList[];
}
