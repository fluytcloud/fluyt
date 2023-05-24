import {Component} from "@angular/core";
import {HeaderService} from "../../../../../components/header/header.service";
import {ActivatedRoute} from "@angular/router";
import {KubernetesSupportNamespaceObjectFilter} from "../../../support/kubernetes.support.namespace.object.filter";
import {KubernetesSupportDetail} from "../../../support/kubernetes.support.detail";
import {Header} from "../../../../../components/header/header";
import {KubernetesAccessControlRoleBindingService} from "../kubernetes.access-control.role-binding.service";
import {KubernetesAccessControlRoleBindingList} from "../kubernetes.access-control.role-binding.list";

@Component({
  selector: 'app-kubernetes-access-control-role-binding-detail',
  templateUrl: './kubernetes.access-control.role-binding.detail.component.html'
})
export class KubernetesAccessControlRoleBindingDetailComponent extends KubernetesSupportDetail<KubernetesAccessControlRoleBindingList> {

  constructor(headerService: HeaderService,
              activatedRoute: ActivatedRoute,
              private roleBindingService: KubernetesAccessControlRoleBindingService) {
    super(headerService, activatedRoute, roleBindingService);
  }

  getHeader(filter: KubernetesSupportNamespaceObjectFilter): Header {
    return {
      name: `RoleBinding ${filter.name} details`,
      breadcrumbs: [
        {
          label: 'RoleBindings',
          link: '/kubernetes/role-bindings'
        },
        {
          label: 'Detail',
          link: `/kubernetes/role-bindings/detail?name=${filter.name}&namespace${filter.namespace}&cluster${filter.clusterId}`
        }
      ]
    };
  }



}
