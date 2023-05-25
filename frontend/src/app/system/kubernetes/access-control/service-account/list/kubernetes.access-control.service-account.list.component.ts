import {Component, OnInit} from "@angular/core";
import {HeaderService} from "../../../../../components/header/header.service";
import {KubernetesSupportList} from "../../../support/kubernetes.support.list";
import {Header} from "../../../../../components/header/header";
import {KubernetesAccessControlServiceAccountList} from "../kubernetes.access-control.service-account.list";
import {KubernetesAccessControlServiceAccountService} from "../kubernetes.access-control.service-account.service";

@Component({
  selector: 'app-kubernetes-access-control-service-account-list',
  templateUrl: './kubernetes.access-control.service-account.list.component.html'
})
export class KubernetesAccessControlServiceAccountListComponent extends KubernetesSupportList<KubernetesAccessControlServiceAccountList> implements OnInit {

  constructor(private serviceAccountService: KubernetesAccessControlServiceAccountService,
              headerService: HeaderService) {
    super(headerService, serviceAccountService);
  }

  getHeader(): Header {
    return {
      name: 'ServiceAccount list',
      breadcrumbs: [
        {
          label: 'ServiceAccounts',
          link: '/kubernetes/service-accounts'
        }
      ]
    };
  }

}
