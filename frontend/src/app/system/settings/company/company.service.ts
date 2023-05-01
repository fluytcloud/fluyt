import {Injectable} from "@angular/core";
import {HttpClient} from "@angular/common/http";
import {CompanyList} from "./company.list";
import {environment} from "../../../../environments/environment";
import {Company} from "./company";
import {CrudServiceImpl} from "../../../support/crud.service.impl";

@Injectable()
export class CompanyService extends CrudServiceImpl<Company, CompanyList> {

  constructor(http: HttpClient) {
    super(http);
  }

  getUrl(): string {
    return `${environment.system_v1}/company`;
  }

}
