export interface KubernetesWorkloadReplicaSetList {
  namespace: string;
  name: string;
  desired: number;
  current: number;
  ready: number;
  age: string;
}
