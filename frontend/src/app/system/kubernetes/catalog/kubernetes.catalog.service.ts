import {Injectable} from "@angular/core";
import {HttpClient} from "@angular/common/http";
import {Observable} from "rxjs";
import {KubernetesCatalog} from "./kubernetes.catalog";
import {environment} from "../../../../environments/environment";
import {Page} from "../../../support/page";

@Injectable()
export class KubernetesCatalogService {

  constructor(private http: HttpClient) {
  }

  get(page: number, size: number): Observable<Page<KubernetesCatalog>> {
    const url = `${environment.system_v1}/kubernetes/cluster?page=${page}&size=${size}`;
    return this.http.get<Page<KubernetesCatalog>>(url);
  }

}
