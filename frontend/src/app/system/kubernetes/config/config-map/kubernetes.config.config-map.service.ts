import {Injectable} from "@angular/core";
import {environment} from "../../../../../environments/environment";
import {HttpClient} from "@angular/common/http";
import {KubernetesConfigConfigMapList} from "./kubernetes.config.config-map.list";
import {KubernetesSupportService} from "../../support/kubernetes.support.service";

@Injectable()
export class KubernetesConfigConfigMapService extends KubernetesSupportService<KubernetesConfigConfigMapList> {

  constructor(http: HttpClient) {
    super(http);
  }

  getUrl(): string {
    return `${environment.system_v1}/kubernetes/config-map`;
  }

}
