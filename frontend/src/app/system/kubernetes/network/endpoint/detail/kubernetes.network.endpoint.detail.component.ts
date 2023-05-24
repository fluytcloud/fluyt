import {Component} from "@angular/core";
import {HeaderService} from "../../../../../components/header/header.service";
import {ActivatedRoute} from "@angular/router";
import {KubernetesSupportNamespaceObjectFilter} from "../../../support/kubernetes.support.namespace.object.filter";
import {KubernetesSupportDetail} from "../../../support/kubernetes.support.detail";
import {Header} from "../../../../../components/header/header";
import {KubernetesNetworkEndpointList} from "../kubernetes.network.endpoint.list";
import {KubernetesNetworkEndpointService} from "../kubernetes.network.endpoint.service";

@Component({
  selector: 'app-kubernetes-network-endpoint-detail',
  templateUrl: './kubernetes.network.endpoint.detail.component.html'
})
export class KubernetesNetworkEndpointDetailComponent extends KubernetesSupportDetail<KubernetesNetworkEndpointList> {

  constructor(headerService: HeaderService,
              activatedRoute: ActivatedRoute,
              private endpointService: KubernetesNetworkEndpointService) {
    super(headerService, activatedRoute, endpointService);
  }

  getHeader(filter: KubernetesSupportNamespaceObjectFilter): Header {
    return {
      name: `Endpoint ${filter.name} details`,
      breadcrumbs: [
        {
          label: 'Endpoints',
          link: '/kubernetes/endpoints'
        },
        {
          label: 'Detail',
          link: `/kubernetes/endpoints/detail?name=${filter.name}&namespace${filter.namespace}&cluster${filter.clusterId}`
        }
      ]
    };
  }



}
