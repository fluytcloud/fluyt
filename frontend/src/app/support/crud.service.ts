import {Observable} from "rxjs";
import {PageLazyService} from "./page.lazy.service";

export interface CrudService<T, LIST> extends PageLazyService<LIST>{

  findById(id: any): Observable<T>;

  persist(id: any, object: T): Observable<T>;

  delete(id: any): Observable<void>;

  search(name: string): Observable<LIST[]>;

}
