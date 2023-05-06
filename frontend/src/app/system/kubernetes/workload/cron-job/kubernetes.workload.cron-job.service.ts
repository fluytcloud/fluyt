import {Injectable} from "@angular/core";
import {environment} from "../../../../../environments/environment";
import {HttpClient} from "@angular/common/http";
import {KubernetesSupportService} from "../../support/kubernetes.support.service";
import {KubernetesWorkloadCronJobList} from "./kubernetes.workload.cron-job.list";

@Injectable()
export class KubernetesWorkloadCronJobService extends KubernetesSupportService<KubernetesWorkloadCronJobList> {

  constructor(http: HttpClient) {
    super(http);
  }

  getUrl(): string {
    return `${environment.system_v1}/kubernetes/cron-job`;
  }

}
