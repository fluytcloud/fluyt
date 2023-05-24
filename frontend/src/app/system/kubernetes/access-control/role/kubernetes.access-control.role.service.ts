import {Injectable} from "@angular/core";
import {environment} from "../../../../../environments/environment";
import {HttpClient} from "@angular/common/http";
import {KubernetesSupportService} from "../../support/kubernetes.support.service";
import {KubernetesAccessControlRoleList} from "./kubernetes.access-control.role.list";

@Injectable()
export class KubernetesAccessControlRoleService extends KubernetesSupportService<KubernetesAccessControlRoleList> {

  constructor(http: HttpClient) {
    super(http);
  }

  getUrl(): string {
    return `${environment.system_v1}/kubernetes/role`;
  }

}
