import {Component} from "@angular/core";
import {HeaderService} from "../../../../../components/header/header.service";
import {ActivatedRoute} from "@angular/router";
import {KubernetesSupportNamespaceObjectFilter} from "../../../support/kubernetes.support.namespace.object.filter";
import {KubernetesSupportDetail} from "../../../support/kubernetes.support.detail";
import {Header} from "../../../../../components/header/header";
import {KubernetesAccessControlRoleList} from "../kubernetes.access-control.role.list";
import {KubernetesAccessControlRoleService} from "../kubernetes.access-control.role.service";

@Component({
  selector: 'app-kubernetes-access-control-role-detail',
  templateUrl: './kubernetes.access-control.role.detail.component.html'
})
export class KubernetesAccessControlRoleDetailComponent extends KubernetesSupportDetail<KubernetesAccessControlRoleList> {

  constructor(headerService: HeaderService,
              activatedRoute: ActivatedRoute,
              private roleService: KubernetesAccessControlRoleService) {
    super(headerService, activatedRoute, roleService);
  }

  getHeader(filter: KubernetesSupportNamespaceObjectFilter): Header {
    return {
      name: `Role ${filter.name} details`,
      breadcrumbs: [
        {
          label: 'Roles',
          link: '/kubernetes/roles'
        },
        {
          label: 'Detail',
          link: `/kubernetes/roles/detail?name=${filter.name}&namespace${filter.namespace}&cluster${filter.clusterId}`
        }
      ]
    };
  }



}
