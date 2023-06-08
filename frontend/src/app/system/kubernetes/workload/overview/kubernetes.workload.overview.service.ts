import {Injectable} from "@angular/core";
import {HttpClient} from "@angular/common/http";
import {Observable} from "rxjs";
import {environment} from "../../../../../environments/environment";
import {QueryParams} from "../../../../support/query.params";
import {KubernetesSearch} from "../../search/kubernetes.search";

@Injectable()
export class KubernetesWorkloadOverviewService {

  constructor(private http: HttpClient) {
  }

  get(filter: KubernetesSearch): Observable<any> {
    const params = QueryParams.transform(filter);
    const url = `${environment.system_v1}/kubernetes/overview`;
    return this.http.get<any>(url, { params: params });
  }

}
