import {Injectable} from "@angular/core";
import {environment} from "../../../../../environments/environment";
import {HttpClient} from "@angular/common/http";
import {KubernetesSupportService} from "../../support/kubernetes.support.service";
import {KubernetesAccessControlRoleBindingList} from "./kubernetes.access-control.role-binding.list";

@Injectable()
export class KubernetesAccessControlRoleBindingService extends KubernetesSupportService<KubernetesAccessControlRoleBindingList> {

  constructor(http: HttpClient) {
    super(http);
  }

  getUrl(): string {
    return `${environment.system_v1}/kubernetes/role-binding`;
  }

}
