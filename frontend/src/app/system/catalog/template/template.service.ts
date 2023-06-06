import {Injectable} from "@angular/core";
import {HttpClient} from "@angular/common/http";
import {CrudServiceImpl} from "../../../support/crud.service.impl";
import {environment} from "../../../../environments/environment";
import {Template} from "./template";
import {Observable} from "rxjs";
import {TemplateParameter} from "./template.parameter";
import {SseService} from "../../../support/sse.service";

@Injectable()
export class TemplateService extends CrudServiceImpl<Template, Template> {

  constructor(http: HttpClient,
              private sse: SseService) {
    super(http);
  }

  getUrl(): string {
    return `${environment.system_v1}/catalog/template`;
  }

  getTemplateParameters(id: number): Observable<TemplateParameter[]> {
    const url = `${this.getUrl()}/${id}/parameters`;
    return this.http.get<TemplateParameter[]>(url);
  }

  generateProject(id: number, repository: string, params: any): Observable<string> {
    const url = `${this.getUrl()}/${id}/generate?repository=${repository}`;
    return this.http.post<string>(url, params);
  }

  getGenerateStatus(id: number, uuid: string): Observable<any> {
    const url = `${this.getUrl()}/${id}/generate/${uuid}/status`;
    return this.sse.getServerSentEvent(url);
  }

}
