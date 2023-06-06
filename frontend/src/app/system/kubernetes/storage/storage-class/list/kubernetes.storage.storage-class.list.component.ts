import {Component} from "@angular/core";
import {HeaderService} from "../../../../../components/header/header.service";
import {KubernetesSupportList} from "../../../support/kubernetes.support.list";
import {Header} from "../../../../../components/header/header";
import {KubernetesStorageStorageClassService} from "../kubernetes.storage.storage-class.service";
import {KubernetesStorageStorageClassList} from "../kubernetes.storage.storage-class.list";

@Component({
  selector: 'app-kubernetes-storage-storage-class-list',
  templateUrl: './kubernetes.storage.storage-class.list.component.html'
})
export class KubernetesStorageStorageClassListComponent extends KubernetesSupportList<KubernetesStorageStorageClassList> {

  constructor(private storageClassService: KubernetesStorageStorageClassService,
              headerService: HeaderService) {
    super(headerService, storageClassService);
  }

  getHeader(): Header {
    return {
      name: 'StorageClass list',
      breadcrumbs: [
        {
          label: 'StorageClasses',
          link: '/kubernetes/storage-classes'
        }
      ]
    };
  }

}
