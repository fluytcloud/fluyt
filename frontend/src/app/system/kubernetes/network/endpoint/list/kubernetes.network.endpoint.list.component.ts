import {Component} from "@angular/core";
import {HeaderService} from "../../../../../components/header/header.service";
import {KubernetesSupportList} from "../../../support/kubernetes.support.list";
import {Header} from "../../../../../components/header/header";
import {KubernetesNetworkEndpointList} from "../kubernetes.network.endpoint.list";
import {KubernetesNetworkEndpointService} from "../kubernetes.network.endpoint.service";

@Component({
  selector: 'app-kubernetes-network-endpoint-list',
  templateUrl: './kubernetes.network.endpoint.list.component.html'
})
export class KubernetesNetworkEndpointListComponent extends KubernetesSupportList<KubernetesNetworkEndpointList> {

  constructor(private endpointService: KubernetesNetworkEndpointService,
              headerService: HeaderService) {
    super(headerService, endpointService);
  }

  getHeader(): Header {
    return {
      name: 'Endpoint list',
      breadcrumbs: [
        {
          label: 'Endpoints',
          link: '/kubernetes/endpoints'
        }
      ]
    };
  }

}
