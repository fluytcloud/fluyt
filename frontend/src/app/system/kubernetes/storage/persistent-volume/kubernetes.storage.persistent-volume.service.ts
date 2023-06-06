import {Injectable} from "@angular/core";
import {environment} from "../../../../../environments/environment";
import {HttpClient} from "@angular/common/http";
import {KubernetesSupportService} from "../../support/kubernetes.support.service";
import {KubernetesStoragePersistentVolumeList} from "./kubernetes.storage.persistent-volume.list";

@Injectable()
export class KubernetesStoragePersistentVolumeService extends KubernetesSupportService<KubernetesStoragePersistentVolumeList> {

  constructor(http: HttpClient) {
    super(http);
  }

  getUrl(): string {
    return `${environment.system_v1}/kubernetes/persistent-volume`;
  }

}
