export interface KubernetesWorkloadDeploymentList {
  namespace: string;
  name: string;
  desired: number;
  current: number;
  replicas: number;
  age: string;
  conditions: KubernetesWorkloadDeploymentCondition[];
}

export interface KubernetesWorkloadDeploymentCondition {
  reason: string;
  status: string;
  type: string;
  message: string;
}
