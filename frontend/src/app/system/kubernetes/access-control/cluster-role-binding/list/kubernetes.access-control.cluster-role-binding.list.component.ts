import {Component} from "@angular/core";
import {HeaderService} from "../../../../../components/header/header.service";
import {KubernetesSupportList} from "../../../support/kubernetes.support.list";
import {Header} from "../../../../../components/header/header";
import {
  KubernetesAccessControlClusterRoleBindingService
} from "../kubernetes.access-control.cluster-role-binding.service";
import {KubernetesAccessControlClusterRoleBindingList} from "../kubernetes.access-control.cluster-role-binding.list";

@Component({
  selector: 'app-kubernetes-access-control-cluster-role-binding-list',
  templateUrl: './kubernetes.access-control.cluster-role-binding.list.component.html'
})
export class KubernetesAccessControlClusterRoleBindingListComponent extends KubernetesSupportList<KubernetesAccessControlClusterRoleBindingList> {

  constructor(private clusterRoleBindingService: KubernetesAccessControlClusterRoleBindingService,
              headerService: HeaderService) {
    super(headerService, clusterRoleBindingService);
  }

  getHeader(): Header {
    return {
      name: 'ClusterRoleBinding list',
      breadcrumbs: [
        {
          label: 'ClusterRoleBindings',
          link: '/kubernetes/cluster-role-bindings'
        }
      ]
    };
  }

}
