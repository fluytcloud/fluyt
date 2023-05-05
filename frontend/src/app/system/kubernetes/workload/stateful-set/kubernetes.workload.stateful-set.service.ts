import {Injectable} from "@angular/core";
import {environment} from "../../../../../environments/environment";
import {HttpClient} from "@angular/common/http";
import {KubernetesSupportService} from "../../support/kubernetes.support.service";
import {KubernetesWorkloadStatefulSetList} from "./kubernetes.workload.stateful-set.list";

@Injectable()
export class KubernetesWorkloadStatefulSetService extends KubernetesSupportService<KubernetesWorkloadStatefulSetList> {

  constructor(http: HttpClient) {
    super(http);
  }

  getUrl(): string {
    return `${environment.system_v1}/kubernetes/stateful-set`;
  }

}
