import {Injectable} from "@angular/core";
import {environment} from "../../../../../environments/environment";
import {HttpClient} from "@angular/common/http";
import {KubernetesSupportService} from "../../support/kubernetes.support.service";
import {KubernetesNetworkServiceList} from "./kubernetes.network.service.list";

@Injectable()
export class KubernetesNetworkServiceService extends KubernetesSupportService<KubernetesNetworkServiceList> {

  constructor(http: HttpClient) {
    super(http);
  }

  getUrl(): string {
    return `${environment.system_v1}/kubernetes/service`;
  }
}
