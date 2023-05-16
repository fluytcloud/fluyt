import {Component} from "@angular/core";
import {KubernetesSupportDetail} from "../../../support/kubernetes.support.detail";
import {HeaderService} from "../../../../../components/header/header.service";
import {ActivatedRoute} from "@angular/router";
import {KubernetesSupportNamespaceObjectFilter} from "../../../support/kubernetes.support.namespace.object.filter";
import {Header} from "../../../../../components/header/header";
import {KubernetesNetworkServiceList} from "../kubernetes.network.service.list";
import {KubernetesNetworkServiceService} from "../kubernetes.network.service.service";

@Component({
  selector: 'app-kubernetes-network-service-detail',
  templateUrl: './kubernetes.network.service.detail.component.html'
})
export class KubernetesNetworkServiceDetailComponent extends KubernetesSupportDetail<KubernetesNetworkServiceList> {

  constructor(headerService: HeaderService,
              activatedRoute: ActivatedRoute,
              private serviceService: KubernetesNetworkServiceService) {
    super(headerService, activatedRoute, serviceService);
  }

  getHeader(filter: KubernetesSupportNamespaceObjectFilter): Header {
    return {
      name: `Service ${filter.name} details`,
      breadcrumbs: [
        {
          label: 'Services',
          link: '/kubernetes/services'
        },
        {
          label: 'Detail',
          link: `/kubernetes/services/detail?name=${filter.name}&namespace${filter.namespace}&cluster${filter.clusterId}`
        }
      ]
    };
  }
}
