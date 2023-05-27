import {Component} from "@angular/core";
import {HeaderService} from "../../../../../components/header/header.service";
import {KubernetesSupportList} from "../../../support/kubernetes.support.list";
import {Header} from "../../../../../components/header/header";
import {KubernetesAccessControlRoleList} from "../kubernetes.access-control.role.list";
import {KubernetesAccessControlRoleService} from "../kubernetes.access-control.role.service";

@Component({
  selector: 'app-kubernetes-access-control-role-list',
  templateUrl: './kubernetes.access-control.role.list.component.html'
})
export class KubernetesAccessControlRoleListComponent extends KubernetesSupportList<KubernetesAccessControlRoleList> {

  constructor(private roleService: KubernetesAccessControlRoleService,
              headerService: HeaderService) {
    super(headerService, roleService);
  }

  getHeader(): Header {
    return {
      name: 'Role list',
      breadcrumbs: [
        {
          label: 'Roles',
          link: '/kubernetes/roles'
        }
      ]
    };
  }

}
