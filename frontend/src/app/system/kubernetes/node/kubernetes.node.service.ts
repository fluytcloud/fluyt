import {Injectable} from "@angular/core";
import {HttpClient} from "@angular/common/http";
import {KubernetesNodeList} from "./kubernetes.node.list";
import {environment} from "../../../../environments/environment";
import {KubernetesSupportService} from "../support/kubernetes.support.service";

@Injectable()
export class KubernetesNodeService extends KubernetesSupportService<KubernetesNodeList> {

  constructor(http: HttpClient) {
    super(http);
  }

  getUrl(): string {
    return `${environment.system_v1}/kubernetes/node`;
  }

}
