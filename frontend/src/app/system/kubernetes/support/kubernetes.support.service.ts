import {HttpClient, HttpHeaders} from "@angular/common/http";
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

  getYaml(filter: KubernetesSupportNamespaceObjectFilter): Observable<any> {
    const params = QueryParams.transform(filter);
    const headers = new HttpHeaders().set('Content-Type', 'application/x-yaml');
    // @ts-ignore
    return this.http.get<any>(this.getUrl(), {params, headers, responseType: 'text'});
  }

  edit(filter: KubernetesSupportNamespaceObjectFilter, yaml: string): Observable<any> {
    const params = QueryParams.transform(filter);
    const headers = new HttpHeaders().set('Content-Type', 'application/x-yaml');
    // @ts-ignore
    return this.http.put<any>(this.getUrl(), yaml, {params, headers, responseType: 'text'});
  }

  findSimple(filter: KubernetesSearch): Observable<any[]> {
    const params = QueryParams.transform(filter);
    const url = `${this.getUrl()}/simple/list`;
    return this.http.get<any[]>(url, { params: params });
  }

}
