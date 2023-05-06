import {Injectable} from "@angular/core";
import {environment} from "../../../../../environments/environment";
import {HttpClient} from "@angular/common/http";
import {KubernetesSupportService} from "../../support/kubernetes.support.service";
import {KubernetesWorkloadJobList} from "./kubernetes.workload.job.list";

@Injectable()
export class KubernetesWorkloadJobService extends KubernetesSupportService<KubernetesWorkloadJobList> {

  constructor(http: HttpClient) {
    super(http);
  }

  getUrl(): string {
    return `${environment.system_v1}/kubernetes/job`;
  }

}
