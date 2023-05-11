import {Component, OnInit} from "@angular/core";
import {HeaderService} from "../../../../../components/header/header.service";
import {KubernetesSupportList} from "../../../support/kubernetes.support.list";
import {Header} from "../../../../../components/header/header";
import {KubernetesNetworkServiceList} from "../kubernetes.network.service.list";
import {KubernetesNetworkServiceService} from "../kubernetes.network.service.service";

@Component({
  selector: 'app-kubernetes-network-service-list',
  templateUrl: './kubernetes.network.service.list.component.html'
})
export class KubernetesNetworkServiceListComponent extends KubernetesSupportList<KubernetesNetworkServiceList> implements OnInit {

  constructor(headerService: HeaderService,
              private serviceService: KubernetesNetworkServiceService) {
    super(headerService, serviceService);
  }

  getHeader(): Header {
    return {
      name: 'Service list',
      breadcrumbs: [
        {
          label: 'Services',
          link: '/kubernetes/services'
        }
      ]
    };
  }
}
