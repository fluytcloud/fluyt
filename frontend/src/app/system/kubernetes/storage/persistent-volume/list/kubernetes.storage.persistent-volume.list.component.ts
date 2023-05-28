import {Component} from "@angular/core";
import {HeaderService} from "../../../../../components/header/header.service";
import {KubernetesSupportList} from "../../../support/kubernetes.support.list";
import {Header} from "../../../../../components/header/header";
import {KubernetesStoragePersistentVolumeList} from "../kubernetes.storage.persistent-volume.list";
import {KubernetesStoragePersistentVolumeService} from "../kubernetes.storage.persistent-volume.service";

@Component({
  selector: 'app-kubernetes-storage-persistent-volume-list',
  templateUrl: './kubernetes.storage.persistent-volume.list.component.html'
})
export class KubernetesStoragePersistentVolumeListComponent extends KubernetesSupportList<KubernetesStoragePersistentVolumeList> {

  constructor(private persistentVolumeService: KubernetesStoragePersistentVolumeService,
              headerService: HeaderService) {
    super(headerService, persistentVolumeService);
  }

  getHeader(): Header {
    return {
      name: 'PersistentVolume list',
      breadcrumbs: [
        {
          label: 'PersistentVolume',
          link: '/kubernetes/persistent-volumes'
        }
      ]
    };
  }

}
