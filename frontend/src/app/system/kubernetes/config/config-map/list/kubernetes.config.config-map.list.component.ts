import {Component} from "@angular/core";
import {HeaderService} from "../../../../../components/header/header.service";
import {KubernetesConfigConfigMapList} from "../kubernetes.config.config-map.list";
import {KubernetesConfigConfigMapService} from "../kubernetes.config.config-map.service";
import {KubernetesSupportList} from "../../../support/kubernetes.support.list";
import {Header} from "../../../../../components/header/header";

@Component({
  selector: 'app-kubernetes-config-config-map-list',
  templateUrl: './kubernetes.config.config-map.list.component.html'
})
export class KubernetesConfigConfigMapListComponent extends KubernetesSupportList<KubernetesConfigConfigMapList> {

  constructor(protected configConfigMapService: KubernetesConfigConfigMapService,
              headerService: HeaderService) {
    super(headerService, configConfigMapService);
  }

  getHeader(): Header {
    return {
      name: 'ConfigMap list',
      breadcrumbs: [
        {
          label: 'ConfigMaps',
          link: '/kubernetes/config-maps'
        }
      ]
    };
  }

}
