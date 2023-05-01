import {Injectable} from "@angular/core";
import {environment} from "../../../../../environments/environment";
import {HttpClient} from "@angular/common/http";
import {Observable} from "rxjs";
import {KubernetesWorkloadPodList} from "../../workload/pod/kubernetes.workload.pod.list";
import {QueryParams} from "../../../../support/query.params";
import {KubernetesConfigConfigMapList} from "./kubernetes.config.config-map.list";
import {KubernetesSupportNamespaceObjectFilter} from "../../support/kubernetes.support.namespace.object.filter";
import {
  KubernetesSupportNamespaceObjectFilterList
} from "../../support/kubernetes.support.namespace.object.filter.list";

@Injectable()
export class KubernetesConfigConfigMapService {

  private static URL = `${environment.system_v1}/kubernetes/config-map`;

  constructor(private http: HttpClient) {
  }

  find(filter: KubernetesSupportNamespaceObjectFilterList): Observable<KubernetesConfigConfigMapList[]> {
    const params = QueryParams.transform(filter);
    const url = `${KubernetesConfigConfigMapService.URL}/list`;
    return this.http.get<KubernetesConfigConfigMapList[]>(url, { params: params });
  }

  get(filter: KubernetesSupportNamespaceObjectFilter): Observable<any> {
    const params = QueryParams.transform(filter);
    console.log(params);
    const url = `${KubernetesConfigConfigMapService.URL}`;
    return this.http.get<KubernetesWorkloadPodList[]>(url, { params: params });
  }

}
