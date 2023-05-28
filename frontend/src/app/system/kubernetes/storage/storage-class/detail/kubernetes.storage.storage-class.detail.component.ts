import {Component} from "@angular/core";
import {HeaderService} from "../../../../../components/header/header.service";
import {ActivatedRoute} from "@angular/router";
import {KubernetesSupportNamespaceObjectFilter} from "../../../support/kubernetes.support.namespace.object.filter";
import {KubernetesSupportDetail} from "../../../support/kubernetes.support.detail";
import {Header} from "../../../../../components/header/header";
import {KubernetesStorageStorageClassService} from "../kubernetes.storage.storage-class.service";
import {KubernetesStorageStorageClassList} from "../kubernetes.storage.storage-class.list";

@Component({
  selector: 'app-kubernetes-storage-storage-class-detail',
  templateUrl: './kubernetes.storage.storage-class.detail.component.html'
})
export class KubernetesStorageStorageClassDetailComponent extends KubernetesSupportDetail<KubernetesStorageStorageClassList> {

  constructor(headerService: HeaderService,
              activatedRoute: ActivatedRoute,
              private storageClassService: KubernetesStorageStorageClassService) {
    super(headerService, activatedRoute, storageClassService);
  }

  getHeader(filter: KubernetesSupportNamespaceObjectFilter): Header {
    return {
      name: `StorageClass ${filter.name} details`,
      breadcrumbs: [
        {
          label: 'StorageClasses',
          link: '/kubernetes/storage-classes'
        },
        {
          label: 'Detail',
          link: `/kubernetes/storage-classes/detail?name=${filter.name}&cluster${filter.clusterId}`
        }
      ]
    };
  }



}
