export interface KubernetesConfigHorizontalPodAutoscalerList {
  name: string;
  namespace: string;
  metrics: string[];
  minPods: number;
  maxPods: number;
  replicas: number;
  status: string[];
  age: string;
}
