import {Component} from "@angular/core";
import {HeaderService} from "../../../../components/header/header.service";
import {KubernetesSupportList} from "../../support/kubernetes.support.list";
import {Header} from "../../../../components/header/header";
import {KubernetesNodeList} from "../kubernetes.node.list";
import {KubernetesNodeService} from "../kubernetes.node.service";

@Component({
  selector: 'app-kubernetes-node-list',
  templateUrl: './kubernetes.node.list.component.html'
})
export class KubernetesNodeListComponent extends KubernetesSupportList<KubernetesNodeList> {

  constructor(private nodeService: KubernetesNodeService,
              headerService: HeaderService) {
    super(headerService, nodeService);
  }

  getHeader(): Header {
    return {
      name: 'Node list',
      breadcrumbs: [
        {
          label: 'Node',
          link: '/kubernetes/nodes'
        }
      ]
    };
  }

}
