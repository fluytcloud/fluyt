import {Injectable} from "@angular/core";
import {environment} from "../../../../../environments/environment";
import {HttpClient} from "@angular/common/http";
import {KubernetesSupportService} from "../../support/kubernetes.support.service";
import {KubernetesAccessControlClusterRoleList} from "./kubernetes.access-control.cluster-role.list";

@Injectable()
export class KubernetesAccessControlClusterRoleService extends KubernetesSupportService<KubernetesAccessControlClusterRoleList> {

  constructor(http: HttpClient) {
    super(http);
  }

  getUrl(): string {
    return `${environment.system_v1}/kubernetes/cluster-role`;
  }

}
