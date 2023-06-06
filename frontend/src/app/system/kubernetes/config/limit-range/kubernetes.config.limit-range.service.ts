import {Injectable} from "@angular/core";
import {environment} from "../../../../../environments/environment";
import {HttpClient} from "@angular/common/http";
import {KubernetesSupportService} from "../../support/kubernetes.support.service";
import {KubernetesConfigLimitRangeList} from "./kubernetes.config.limit-range.list";

@Injectable()
export class KubernetesConfigLimitRangeService extends KubernetesSupportService<KubernetesConfigLimitRangeList> {

  constructor(http: HttpClient) {
    super(http);
  }

  getUrl(): string {
    return `${environment.system_v1}/kubernetes/limit-range`;
  }

}
