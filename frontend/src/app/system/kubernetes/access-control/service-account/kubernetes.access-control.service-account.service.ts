import {Injectable} from "@angular/core";
import {environment} from "../../../../../environments/environment";
import {HttpClient} from "@angular/common/http";
import {KubernetesSupportService} from "../../support/kubernetes.support.service";
import {KubernetesAccessControlServiceAccountList} from "./kubernetes.access-control.service-account.list";

@Injectable()
export class KubernetesAccessControlServiceAccountService extends KubernetesSupportService<KubernetesAccessControlServiceAccountList> {

  constructor(http: HttpClient) {
    super(http);
  }

  getUrl(): string {
    return `${environment.system_v1}/kubernetes/service-account`;
  }

}
