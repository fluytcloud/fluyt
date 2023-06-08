import {Injectable} from "@angular/core";
import {KubernetesSupportService} from "../support/kubernetes.support.service";
import {HttpClient} from "@angular/common/http";
import {environment} from "../../../../environments/environment";
import {KubernetesEventList} from "./kubernetes.event.list";

@Injectable()
export class KubernetesEventService extends KubernetesSupportService<KubernetesEventList> {

  constructor(http: HttpClient) {
    super(http);
  }

  getUrl(): string {
    return `${environment.system_v1}/kubernetes/events`;
  }

}
