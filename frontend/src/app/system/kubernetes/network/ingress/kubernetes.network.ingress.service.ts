import {Injectable} from "@angular/core";
import {environment} from "../../../../../environments/environment";
import {HttpClient} from "@angular/common/http";
import {KubernetesSupportService} from "../../support/kubernetes.support.service";
import {KubernetesNetworkIngressList} from "./kubernetes.network.ingress.list";

@Injectable()
export class KubernetesNetworkIngressService extends KubernetesSupportService<KubernetesNetworkIngressList> {

  constructor(http: HttpClient) {
    super(http);
  }

  getUrl(): string {
    return `${environment.system_v1}/kubernetes/ingress`;
  }

}
