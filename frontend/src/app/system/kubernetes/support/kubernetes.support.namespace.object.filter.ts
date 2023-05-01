export class KubernetesSupportNamespaceObjectFilter {
  clusterId!: number;
  namespace!: string;
  name!: string;

  constructor(clusterId: number, namespace: string, name: string) {
    this.clusterId = clusterId;
    this.namespace = namespace;
    this.name = name;
  }

}
