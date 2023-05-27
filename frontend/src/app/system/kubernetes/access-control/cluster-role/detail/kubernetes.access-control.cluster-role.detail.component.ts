import {Component} from "@angular/core";
import {HeaderService} from "../../../../../components/header/header.service";
import {ActivatedRoute} from "@angular/router";
import {KubernetesSupportNamespaceObjectFilter} from "../../../support/kubernetes.support.namespace.object.filter";
import {KubernetesSupportDetail} from "../../../support/kubernetes.support.detail";
import {Header} from "../../../../../components/header/header";
import {KubernetesAccessControlClusterRoleList} from "../kubernetes.access-control.cluster-role.list";
import {KubernetesAccessControlClusterRoleService} from "../kubernetes.access-control.cluster-role.service";

@Component({
  selector: 'app-kubernetes-access-control-cluster-role-detail',
  templateUrl: './kubernetes.access-control.cluster-role.detail.component.html'
})
export class KubernetesAccessControlClusterRoleDetailComponent extends KubernetesSupportDetail<KubernetesAccessControlClusterRoleList> {

  constructor(headerService: HeaderService,
              activatedRoute: ActivatedRoute,
              private clusterRoleService: KubernetesAccessControlClusterRoleService) {
    super(headerService, activatedRoute, clusterRoleService);
  }

  getHeader(filter: KubernetesSupportNamespaceObjectFilter): Header {
    return {
      name: `ClusterRole ${filter.name} details`,
      breadcrumbs: [
        {
          label: 'ClusterRoles',
          link: '/kubernetes/cluster-roles'
        },
        {
          label: 'Detail',
          link: `/kubernetes/cluster-roles/detail?name=${filter.name}&cluster${filter.clusterId}`
        }
      ]
    };
  }



}
