export interface KubernetesNetworkIngressList {
  name: string;
  namespace: string;
  loadBalancers: string[];
  rules: string[];
  age: string;
}
