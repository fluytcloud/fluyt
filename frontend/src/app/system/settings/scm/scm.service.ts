import {Injectable} from "@angular/core";
import {HttpClient} from "@angular/common/http";
import {Scm} from "./scm";
import {CrudServiceImpl} from "../../../support/crud.service.impl";
import {environment} from "../../../../environments/environment";

@Injectable()
export class ScmService extends CrudServiceImpl<Scm, Scm> {

  constructor(http: HttpClient) {
    super(http);
  }

  getUrl(): string {
    return `${environment.system_v1}/scm`;
  }

}
