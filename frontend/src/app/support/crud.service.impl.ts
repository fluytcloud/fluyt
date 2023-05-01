import {Injectable} from "@angular/core";
import {HttpClient, HttpParams} from "@angular/common/http";
import {Observable} from "rxjs";
import {PageLazyService} from "./page.lazy.service";
import {Page} from "./page";
import {CrudService} from "./crud.service";

@Injectable()
export abstract class CrudServiceImpl<T, LIST> implements PageLazyService<LIST>, CrudService<T, LIST> {

  protected constructor(protected readonly http: HttpClient) {
  }

  abstract getUrl(): string;

  findAll(page: number, size: number): Observable<Page<LIST>> {
    const url = `${this.getUrl()}?page=${page}&size=${size}`
    return this.http.get<Page<LIST>>(url);
  }

  findById(id: any): Observable<T> {
    const url = `${this.getUrl()}/${id}`;
    return this.http.get<T>(url)
  }

  persist(id: any, object: T): Observable<T> {
    if (id) {
      const url = `${this.getUrl()}/${id}`;
      return this.http.put<T>(url, object)
    }
    return this.http.post<T>(this.getUrl(), object)
  }

  delete(id: any): Observable<void> {
    const url = `${this.getUrl()}/${id}`;
    return this.http.delete<void>(url)
  }

  search(name: string): Observable<LIST[]> {
    let params = new HttpParams();
    if (name) {
      params = params.set('search', name);
    }

    const url = `${this.getUrl()}/search`;
    return this.http.get<LIST[]>(url, {params: params});
  }

}
