export interface KubernetesNetworkServiceList {
  namespace: string,
  name: string,
  type: string,
  clusterIp: string,
  ports: string[],
  externalIps: string[],
  selectors: string[],
  status: string[],
  age: string
}
