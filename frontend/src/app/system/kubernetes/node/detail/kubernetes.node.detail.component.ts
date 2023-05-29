import {Component} from "@angular/core";
import {HeaderService} from "../../../../components/header/header.service";
import {ActivatedRoute} from "@angular/router";
import {KubernetesSupportNamespaceObjectFilter} from "../../support/kubernetes.support.namespace.object.filter";
import {KubernetesSupportDetail} from "../../support/kubernetes.support.detail";
import {Header} from "../../../../components/header/header";
import {KubernetesNodeList} from "../kubernetes.node.list";
import {KubernetesNodeService} from "../kubernetes.node.service";

@Component({
  selector: 'app-kubernetes-node-detail',
  templateUrl: './kubernetes.node.detail.component.html'
})
export class KubernetesNodeDetailComponent extends KubernetesSupportDetail<KubernetesNodeList> {

  constructor(headerService: HeaderService,
              activatedRoute: ActivatedRoute,
              private nodeService: KubernetesNodeService) {
    super(headerService, activatedRoute, nodeService);
  }

  getHeader(filter: KubernetesSupportNamespaceObjectFilter): Header {
    return {
      name: `Node ${filter.name} details`,
      breadcrumbs: [
        {
          label: 'Nodes',
          link: '/kubernetes/nodes'
        },
        {
          label: 'Detail',
          link: `/kubernetes/nodes/detail?name=${filter.name}&cluster${filter.clusterId}`
        }
      ]
    };
  }



}
