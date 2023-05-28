import {Component} from "@angular/core";
import {HeaderService} from "../../../../../components/header/header.service";
import {KubernetesSupportList} from "../../../support/kubernetes.support.list";
import {Header} from "../../../../../components/header/header";
import {KubernetesAccessControlClusterRoleService} from "../kubernetes.access-control.cluster-role.service";
import {KubernetesAccessControlClusterRoleList} from "../kubernetes.access-control.cluster-role.list";

@Component({
  selector: 'app-kubernetes-access-control-cluster-role-list',
  templateUrl: './kubernetes.access-control.cluster-role.list.component.html'
})
export class KubernetesAccessControlClusterRoleListComponent extends KubernetesSupportList<KubernetesAccessControlClusterRoleList> {

  constructor(private clusteRoleService: KubernetesAccessControlClusterRoleService,
              headerService: HeaderService) {
    super(headerService, clusteRoleService);
  }

  getHeader(): Header {
    return {
      name: 'ClusterRole list',
      breadcrumbs: [
        {
          label: 'ClusterRoles',
          link: '/kubernetes/cluster-roles'
        }
      ]
    };
  }

}
