import {Component} from "@angular/core";
import {HeaderService} from "../../../../../components/header/header.service";
import {ActivatedRoute} from "@angular/router";
import {KubernetesSupportNamespaceObjectFilter} from "../../../support/kubernetes.support.namespace.object.filter";
import {KubernetesSupportDetail} from "../../../support/kubernetes.support.detail";
import {Header} from "../../../../../components/header/header";
import {KubernetesStoragePersistentVolumeClaimList} from "../kubernetes.storage.persistent-volume-claim.list";
import {KubernetesStoragePersistentVolumeClaimService} from "../kubernetes.storage.persistent-volume-claim.service";

@Component({
  selector: 'app-kubernetes-storage-persistent-volume-claim-detail',
  templateUrl: './kubernetes.storage.persistent-volume-claim.detail.component.html'
})
export class KubernetesStoragePersistentVolumeClaimDetailComponent extends KubernetesSupportDetail<KubernetesStoragePersistentVolumeClaimList> {

  constructor(headerService: HeaderService,
              activatedRoute: ActivatedRoute,
              private persistentVolumeClaimService: KubernetesStoragePersistentVolumeClaimService) {
    super(headerService, activatedRoute, persistentVolumeClaimService);
  }

  getHeader(filter: KubernetesSupportNamespaceObjectFilter): Header {
    return {
      name: `PersistentVolumeClaim ${filter.name} details`,
      breadcrumbs: [
        {
          label: 'PersistentVolumeClaims',
          link: '/kubernetes/persistent-volume-claims'
        },
        {
          label: 'Detail',
          link: `/kubernetes/persistent-volume-claims/detail?name=${filter.name}&namespace${filter.namespace}&cluster${filter.clusterId}`
        }
      ]
    };
  }



}
