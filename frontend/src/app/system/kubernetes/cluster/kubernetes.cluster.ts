import {KubernetesClusterConnectionType} from "./kubernetes.cluster.connection.type";

export interface KubernetesCluster {
  id: number,
  name: string,
  connectionType: KubernetesClusterConnectionType,
  url: string,
  token: string,
  username: string,
  password: string,
  validateSSL: boolean
}
