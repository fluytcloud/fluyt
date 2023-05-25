import {Component, OnInit} from "@angular/core";
import {HeaderService} from "../../../../../components/header/header.service";
import {KubernetesSupportList} from "../../../support/kubernetes.support.list";
import {Header} from "../../../../../components/header/header";
import {KubernetesAccessControlRoleBindingService} from "../kubernetes.access-control.role-binding.service";
import {KubernetesAccessControlRoleBindingList} from "../kubernetes.access-control.role-binding.list";

@Component({
  selector: 'app-kubernetes-access-control-role-binding-list',
  templateUrl: './kubernetes.access-control.role-binding.list.component.html'
})
export class KubernetesAccessControlRoleBindingListComponent extends KubernetesSupportList<KubernetesAccessControlRoleBindingList> implements OnInit {

  constructor(private roleBindingService: KubernetesAccessControlRoleBindingService,
              headerService: HeaderService) {
    super(headerService, roleBindingService);
  }

  getHeader(): Header {
    return {
      name: 'RoleBinding list',
      breadcrumbs: [
        {
          label: 'RoleBindings',
          link: '/kubernetes/role-bindings'
        }
      ]
    };
  }

}
