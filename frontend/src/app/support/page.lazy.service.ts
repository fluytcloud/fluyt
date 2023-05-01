import {Observable} from "rxjs";
import {Page} from "./page";

export interface PageLazyService<T> {

  findAll(page: number, size: number): Observable<Page<T>>;

}
