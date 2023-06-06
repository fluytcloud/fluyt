import {Injectable} from "@angular/core";
import {environment} from "../../../../../environments/environment";
import {HttpClient} from "@angular/common/http";
import {KubernetesSupportService} from "../../support/kubernetes.support.service";
import {KubernetesStorageStorageClassList} from "./kubernetes.storage.storage-class.list";

@Injectable()
export class KubernetesStorageStorageClassService extends KubernetesSupportService<KubernetesStorageStorageClassList> {

  constructor(http: HttpClient) {
    super(http);
  }

  getUrl(): string {
    return `${environment.system_v1}/kubernetes/storage-class`;
  }

}
