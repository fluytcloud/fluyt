export class KubernetesSearch {
  clusterId: number;
  namespaces?: string[];
  name?: string;

  constructor(clusterId: number) {
    this.clusterId = clusterId;
  }

}
