export class KubernetesSearch {
  clusterId: number;
  namespaces?: string[];
  name?: string;
  labelSelector?: string;
  owner?: string[];
  constructor(clusterId: number) {
    this.clusterId = clusterId;
  }

}
