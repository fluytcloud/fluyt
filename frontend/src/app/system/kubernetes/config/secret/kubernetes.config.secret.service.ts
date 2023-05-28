import {Injectable} from "@angular/core";
import {environment} from "../../../../../environments/environment";
import {HttpClient} from "@angular/common/http";
import {KubernetesSupportService} from "../../support/kubernetes.support.service";
import {KubernetesConfigSecretList} from "./kubernetes.config.secret.list";

@Injectable()
export class KubernetesConfigSecretService extends KubernetesSupportService<KubernetesConfigSecretList> {

  constructor(http: HttpClient) {
    super(http);
  }

  getUrl(): string {
    return `${environment.system_v1}/kubernetes/secret`;
  }

}
