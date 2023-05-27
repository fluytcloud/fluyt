import {Component} from "@angular/core";
import {HeaderService} from "../../../../../components/header/header.service";
import {KubernetesSupportList} from "../../../support/kubernetes.support.list";
import {Header} from "../../../../../components/header/header";
import {KubernetesStoragePersistentVolumeClaimService} from "../kubernetes.storage.persistent-volume-claim.service";
import {KubernetesStoragePersistentVolumeClaimList} from "../kubernetes.storage.persistent-volume-claim.list";

@Component({
  selector: 'app-kubernetes-storage-persistent-volume-claim-list',
  templateUrl: './kubernetes.storage.persistent-volume-claim.list.component.html'
})
export class KubernetesStoragePersistentVolumeClaimListComponent extends KubernetesSupportList<KubernetesStoragePersistentVolumeClaimList> {

  constructor(private persistentVolumeClaimService: KubernetesStoragePersistentVolumeClaimService,
              headerService: HeaderService) {
    super(headerService, persistentVolumeClaimService);
  }

  getHeader(): Header {
    return {
      name: 'PersistentVolumeClaim list',
      breadcrumbs: [
        {
          label: 'PersistentVolumeClaims',
          link: '/kubernetes/persistent-volume-claims'
        }
      ]
    };
  }

}
