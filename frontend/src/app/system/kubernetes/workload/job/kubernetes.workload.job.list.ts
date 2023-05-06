export interface KubernetesWorkloadJobList {
  name: string;
  namespace: string;
  active: number;
  failed: number;
  ready: number;
  succeeded: number;
  conditions: string[];
  age: string;
}
