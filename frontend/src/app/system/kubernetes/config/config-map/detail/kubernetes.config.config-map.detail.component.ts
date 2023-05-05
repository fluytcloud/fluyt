import {Component} from "@angular/core";
import {HeaderService} from "../../../../../components/header/header.service";
import {ActivatedRoute} from "@angular/router";
import {KubernetesSupportNamespaceObjectFilter} from "../../../support/kubernetes.support.namespace.object.filter";
import {KubernetesConfigConfigMapService} from "../kubernetes.config.config-map.service";
import {KubernetesSupportDetail} from "../../../support/kubernetes.support.detail";
import {KubernetesConfigConfigMapList} from "../kubernetes.config.config-map.list";
import {Header} from "../../../../../components/header/header";

@Component({
  selector: 'app-kubernetes-config-config-map-detail',
  templateUrl: './kubernetes.config.config-map.detail.component.html',
  styleUrls: ['./kubernetes.config.config-map.detail.component.scss']
})
export class KubernetesConfigConfigMapDetailComponent extends KubernetesSupportDetail<KubernetesConfigConfigMapList> {

  codeMirrorConfig = {
    readOnly: true,
    lineNumbers: true,
    theme: 'material'
  };

  constructor(headerService: HeaderService,
              activatedRoute: ActivatedRoute,
              private configMapService: KubernetesConfigConfigMapService) {
    super(headerService, activatedRoute, configMapService);
  }

  getHeader(filter: KubernetesSupportNamespaceObjectFilter): Header {
    return {
      name: `ConfigMap ${filter.name} details`,
      breadcrumbs: [
        {
          label: 'ConfigMaps',
          link: '/kubernetes/config-maps'
        },
        {
          label: 'Detail',
          link: `/kubernetes/config-maps/detail?name=${filter.name}&namespace=${filter.namespace}&cluster=${filter.clusterId}`
        }
      ]
    };
  }

}
