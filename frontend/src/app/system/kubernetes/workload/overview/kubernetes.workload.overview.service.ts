import {Injectable} from "@angular/core";
import {HttpClient} from "@angular/common/http";
import {Observable} from "rxjs";
import {KubernetesWorkloadOverview} from "./kubernetes.workload.overview";
import {environment} from "../../../../../environments/environment";

@Injectable()
export class KubernetesWorkloadOverviewService {

  constructor(private http: HttpClient) {
  }

  get(clusterId: number): Observable<KubernetesWorkloadOverview> {
    const url = `${environment.system_v1}/kubernetes/overview?clusterId=${clusterId}`;
    return this.http.get<KubernetesWorkloadOverview>(url);
  }

}
