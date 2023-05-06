export interface KubernetesWorkloadDaemonSetList {
  name: string;
  namespace: string;
  pods: string;
  nodeSelector: Map<String, String>;
  age: String;
}
