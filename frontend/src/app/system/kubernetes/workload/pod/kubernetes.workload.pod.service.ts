import {Injectable} from "@angular/core";
import {HttpClient} from "@angular/common/http";
import {Observable} from "rxjs";
import {KubernetesWorkloadPodList} from "./kubernetes.workload.pod.list";
import {environment} from "../../../../../environments/environment";
import {QueryParams} from "../../../../support/query.params";
import {KubernetesSupportNamespaceObjectFilter} from "../../support/kubernetes.support.namespace.object.filter";
import {
  KubernetesSupportNamespaceObjectFilterList
} from "../../support/kubernetes.support.namespace.object.filter.list";

@Injectable()
export class KubernetesWorkloadPodService {

  private static URL = `${environment.system_v1}/kubernetes/pod`;

  constructor(private http: HttpClient) {
  }

  find(filter: KubernetesSupportNamespaceObjectFilterList): Observable<KubernetesWorkloadPodList[]> {
    const params = QueryParams.transform(filter);
    const url = `${KubernetesWorkloadPodService.URL}/list`;
    return this.http.get<KubernetesWorkloadPodList[]>(url, { params: params });
  }

  get(filter: KubernetesSupportNamespaceObjectFilter): Observable<any> {
    const params = QueryParams.transform(filter);
    console.log(params);
    const url = `${KubernetesWorkloadPodService.URL}`;
    return this.http.get<KubernetesWorkloadPodList[]>(url, { params: params });
  }


}
