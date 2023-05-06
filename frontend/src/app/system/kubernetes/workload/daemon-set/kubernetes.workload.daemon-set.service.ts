import {Injectable} from "@angular/core";
import {environment} from "../../../../../environments/environment";
import {HttpClient} from "@angular/common/http";
import {KubernetesSupportService} from "../../support/kubernetes.support.service";
import {KubernetesWorkloadDaemonSetList} from "./kubernetes.workload.daemon-set.list";

@Injectable()
export class KubernetesWorkloadDaemonSetService extends KubernetesSupportService<KubernetesWorkloadDaemonSetList> {

  constructor(http: HttpClient) {
    super(http);
  }

  getUrl(): string {
    return `${environment.system_v1}/kubernetes/daemon-set`;
  }

}
