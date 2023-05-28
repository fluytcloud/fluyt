import {Injectable} from "@angular/core";
import {environment} from "../../../../../environments/environment";
import {HttpClient} from "@angular/common/http";
import {KubernetesSupportService} from "../../support/kubernetes.support.service";
import {KubernetesAccessControlClusterRoleBindingList} from "./kubernetes.access-control.cluster-role-binding.list";

@Injectable()
export class KubernetesAccessControlClusterRoleBindingService extends KubernetesSupportService<KubernetesAccessControlClusterRoleBindingList> {

  constructor(http: HttpClient) {
    super(http);
  }

  getUrl(): string {
    return `${environment.system_v1}/kubernetes/cluster-role-binding`;
  }

}
