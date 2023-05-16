import {Component} from "@angular/core";
import {HeaderService} from "../../../../../components/header/header.service";
import {ActivatedRoute} from "@angular/router";
import {KubernetesSupportNamespaceObjectFilter} from "../../../support/kubernetes.support.namespace.object.filter";
import {KubernetesSupportDetail} from "../../../support/kubernetes.support.detail";
import {Header} from "../../../../../components/header/header";
import {KubernetesNetworkIngressService} from "../kubernetes.network.ingress.service";
import {KubernetesNetworkIngressList} from "../kubernetes.network.ingress.list";

@Component({
  selector: 'app-kubernetes-network-detail-detail',
  templateUrl: './kubernetes.network.ingress.detail.component.html'
})
export class KubernetesNetworkIngressDetailComponent extends KubernetesSupportDetail<KubernetesNetworkIngressList> {

  constructor(headerService: HeaderService,
              activatedRoute: ActivatedRoute,
              private ingressService: KubernetesNetworkIngressService) {
    super(headerService, activatedRoute, ingressService);
  }

  getHeader(filter: KubernetesSupportNamespaceObjectFilter): Header {
    return {
      name: `Ingress ${filter.name} details`,
      breadcrumbs: [
        {
          label: 'Ingresses',
          link: '/kubernetes/ingresses'
        },
        {
          label: 'Detail',
          link: `/kubernetes/ingresses/detail?name=${filter.name}&namespace${filter.namespace}&cluster${filter.clusterId}`
        }
      ]
    };
  }



}
