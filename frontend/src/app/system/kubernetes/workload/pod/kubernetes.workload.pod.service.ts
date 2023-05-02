import {Injectable} from "@angular/core";
import {HttpClient} from "@angular/common/http";
import {KubernetesWorkloadPodList} from "./kubernetes.workload.pod.list";
import {environment} from "../../../../../environments/environment";
import {KubernetesSupportService} from "../../support/kubernetes.support.service";

@Injectable()
export class KubernetesWorkloadPodService extends KubernetesSupportService<KubernetesWorkloadPodList> {

  constructor(http: HttpClient) {
    super(http);
  }

  getUrl(): string {
    return `${environment.system_v1}/kubernetes/pod`;
  }

}
