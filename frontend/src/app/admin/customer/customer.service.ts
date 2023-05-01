import {Injectable} from "@angular/core";
import {HttpClient} from "@angular/common/http";
import {Observable} from "rxjs";
import {environment} from "../../../environments/environment";
import {CustomerList} from "./customer.list";
import {Customer} from "./customer";
import {CrudServiceImpl} from "../../support/crud.service.impl";

@Injectable()
export class CustomerService extends CrudServiceImpl<Customer, CustomerList> {

  constructor(http: HttpClient) {
    super(http);
  }

  getUrl(): string {
    return `${environment.admin_customer}`;
  }

  changeActive(id: number): Observable<void> {
    const url = `${this.getUrl()}/${id}/active`;
    return this.http.patch<void>(url, null);
  }

}
