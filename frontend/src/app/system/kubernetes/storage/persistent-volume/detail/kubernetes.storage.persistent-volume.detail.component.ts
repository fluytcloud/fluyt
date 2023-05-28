import {Component} from "@angular/core";
import {HeaderService} from "../../../../../components/header/header.service";
import {ActivatedRoute} from "@angular/router";
import {KubernetesSupportNamespaceObjectFilter} from "../../../support/kubernetes.support.namespace.object.filter";
import {KubernetesSupportDetail} from "../../../support/kubernetes.support.detail";
import {Header} from "../../../../../components/header/header";
import {KubernetesStoragePersistentVolumeList} from "../kubernetes.storage.persistent-volume.list";
import {KubernetesStoragePersistentVolumeService} from "../kubernetes.storage.persistent-volume.service";

@Component({
  selector: 'app-kubernetes-storage-persistent-volume-detail',
  templateUrl: './kubernetes.storage.persistent-volume.detail.component.html'
})
export class KubernetesStoragePersistentVolumeDetailComponent extends KubernetesSupportDetail<KubernetesStoragePersistentVolumeList> {

  constructor(headerService: HeaderService,
              activatedRoute: ActivatedRoute,
              private persistentVolumeService: KubernetesStoragePersistentVolumeService) {
    super(headerService, activatedRoute, persistentVolumeService);
  }

  getHeader(filter: KubernetesSupportNamespaceObjectFilter): Header {
    return {
      name: `PersistentVolume ${filter.name} details`,
      breadcrumbs: [
        {
          label: 'PersistentVolumes',
          link: '/kubernetes/persistent-volumes'
        },
        {
          label: 'Detail',
          link: `/kubernetes/persistent-volumes/detail?name=${filter.name}&cluster${filter.clusterId}`
        }
      ]
    };
  }



}
