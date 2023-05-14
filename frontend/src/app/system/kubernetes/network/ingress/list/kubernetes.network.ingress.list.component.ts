import {Component, OnInit} from "@angular/core";
import {HeaderService} from "../../../../../components/header/header.service";
import {KubernetesSupportList} from "../../../support/kubernetes.support.list";
import {Header} from "../../../../../components/header/header";
import {KubernetesNetworkIngressService} from "../kubernetes.network.ingress.service";
import {KubernetesNetworkIngressList} from "../kubernetes.network.ingress.list";

@Component({
  selector: 'app-kubernetes-network-ingress-list',
  templateUrl: './kubernetes.network.ingress.list.component.html'
})
export class KubernetesNetworkIngressListComponent extends KubernetesSupportList<KubernetesNetworkIngressList> implements OnInit {

  constructor(private ingressService: KubernetesNetworkIngressService,
              headerService: HeaderService) {
    super(headerService, ingressService);
  }

  getHeader(): Header {
    return {
      name: 'Ingress list',
      breadcrumbs: [
        {
          label: 'Ingresses',
          link: '/kubernetes/ingresses'
        }
      ]
    };
  }

}
