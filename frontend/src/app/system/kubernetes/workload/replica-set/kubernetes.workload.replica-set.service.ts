import {Injectable} from "@angular/core";
import {environment} from "../../../../../environments/environment";
import {HttpClient} from "@angular/common/http";
import {KubernetesSupportService} from "../../support/kubernetes.support.service";
import {KubernetesWorkloadReplicaSetList} from "./kubernetes.workload.replica-set.list";

@Injectable()
export class KubernetesWorkloadReplicaSetService extends KubernetesSupportService<KubernetesWorkloadReplicaSetList> {

  constructor(http: HttpClient) {
    super(http);
  }

  getUrl(): string {
    return `${environment.system_v1}/kubernetes/replica-set`;
  }

}
