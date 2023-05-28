import {Component} from "@angular/core";
import {HeaderService} from "../../../../../components/header/header.service";
import {ActivatedRoute} from "@angular/router";
import {KubernetesSupportNamespaceObjectFilter} from "../../../support/kubernetes.support.namespace.object.filter";
import {KubernetesSupportDetail} from "../../../support/kubernetes.support.detail";
import {Header} from "../../../../../components/header/header";
import {KubernetesAccessControlClusterRoleBindingList} from "../kubernetes.access-control.cluster-role-binding.list";
import {
  KubernetesAccessControlClusterRoleBindingService
} from "../kubernetes.access-control.cluster-role-binding.service";

@Component({
  selector: 'app-kubernetes-access-control-cluster-role-binding-detail',
  templateUrl: './kubernetes.access-control.cluster-role-binding.detail.component.html'
})
export class KubernetesAccessControlClusterRoleBindingDetailComponent extends KubernetesSupportDetail<KubernetesAccessControlClusterRoleBindingList> {

  constructor(headerService: HeaderService,
              activatedRoute: ActivatedRoute,
              private clusterRoleBindingService: KubernetesAccessControlClusterRoleBindingService) {
    super(headerService, activatedRoute, clusterRoleBindingService);
  }

  getHeader(filter: KubernetesSupportNamespaceObjectFilter): Header {
    return {
      name: `ClusterRoleBinding ${filter.name} details`,
      breadcrumbs: [
        {
          label: 'ClusterRoleBindings',
          link: '/kubernetes/cluster-role-bindings'
        },
        {
          label: 'Detail',
          link: `/kubernetes/cluster-role-bindings/detail?name=${filter.name}&cluster${filter.clusterId}`
        }
      ]
    };
  }



}
