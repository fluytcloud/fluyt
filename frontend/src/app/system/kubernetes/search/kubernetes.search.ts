export class KubernetesSearch {
  clusterId: number;
  namespaces?: string[];
  name?: string;
  labelSelector?: string;
  constructor(clusterId: number) {
    this.clusterId = clusterId;
  }

}
