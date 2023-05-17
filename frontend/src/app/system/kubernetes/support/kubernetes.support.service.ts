import {HttpClient} from "@angular/common/http";
import {KubernetesSearch} from "../search/kubernetes.search";
import {Observable} from "rxjs";
import {QueryParams} from "../../../support/query.params";
import {KubernetesSupportNamespaceObjectFilter} from "./kubernetes.support.namespace.object.filter";
import {Injectable} from "@angular/core";

@Injectable()
export abstract class KubernetesSupportService<T> {

  protected constructor(protected http: HttpClient) {
  }

  abstract getUrl(): string;

  find(filter: KubernetesSearch): Observable<T[]> {
    const params = QueryParams.transform(filter);
    const url = `${this.getUrl()}/list`;
    return this.http.get<T[]>(url, { params: params });
  }

  get(filter: KubernetesSupportNamespaceObjectFilter): Observable<any> {
    const params = QueryParams.transform(filter);
    console.log(params);
    return this.http.get<any>(this.getUrl(), { params: params });
  }

  findSimple(filter: KubernetesSearch): Observable<any[]> {
    const params = QueryParams.transform(filter);
    const url = `${this.getUrl()}/simple/list`;
    return this.http.get<any[]>(url, { params: params });
  }

}
