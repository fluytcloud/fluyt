import {Injectable} from "@angular/core";
import {environment} from "../../../../../environments/environment";
import {HttpClient} from "@angular/common/http";
import {KubernetesSupportService} from "../../support/kubernetes.support.service";
import {KubernetesStoragePersistentVolumeClaimList} from "./kubernetes.storage.persistent-volume-claim.list";

@Injectable()
export class KubernetesStoragePersistentVolumeClaimService extends KubernetesSupportService<KubernetesStoragePersistentVolumeClaimList> {

  constructor(http: HttpClient) {
    super(http);
  }

  getUrl(): string {
    return `${environment.system_v1}/kubernetes/persistent-volume-claim`;
  }

}
