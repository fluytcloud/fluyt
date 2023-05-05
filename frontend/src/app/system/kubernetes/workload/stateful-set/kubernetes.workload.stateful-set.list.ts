export interface KubernetesWorkloadStatefulSetList {
  name: string;
  namespace: string;
  pods: string;
  replicas: number;
  age: string;
}
