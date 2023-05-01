import {Injectable} from "@angular/core";
import {environment} from "../../../../environments/environment";
import {HttpClient} from "@angular/common/http";
import {KubernetesClusterList} from "./kubernetes.cluster.list";
import {KubernetesCluster} from "./kubernetes.cluster";
import {CrudServiceImpl} from "../../../support/crud.service.impl";

@Injectable()
export class KubernetesClusterService extends CrudServiceImpl<KubernetesCluster, KubernetesClusterList> {

  constructor(http: HttpClient) {
    super(http);
  }

  getUrl(): string {
    return `${environment.system_v1}/kubernetes/cluster`;
  }

}
