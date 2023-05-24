import {Component} from "@angular/core";
import {HeaderService} from "../../../../../components/header/header.service";
import {ActivatedRoute} from "@angular/router";
import {KubernetesSupportNamespaceObjectFilter} from "../../../support/kubernetes.support.namespace.object.filter";
import {KubernetesSupportDetail} from "../../../support/kubernetes.support.detail";
import {Header} from "../../../../../components/header/header";
import {KubernetesAccessControlServiceAccountList} from "../kubernetes.access-control.service-account.list";
import {KubernetesAccessControlServiceAccountService} from "../kubernetes.access-control.service-account.service";

@Component({
  selector: 'app-kubernetes-access-control-service-account-detail',
  templateUrl: './kubernetes.access-control.service-account.detail.component.html'
})
export class KubernetesAccessControlServiceAccountDetailComponent extends KubernetesSupportDetail<KubernetesAccessControlServiceAccountList> {

  constructor(headerService: HeaderService,
              activatedRoute: ActivatedRoute,
              private serviceAccountService: KubernetesAccessControlServiceAccountService) {
    super(headerService, activatedRoute, serviceAccountService);
  }

  getHeader(filter: KubernetesSupportNamespaceObjectFilter): Header {
    return {
      name: `ServiceAccount ${filter.name} details`,
      breadcrumbs: [
        {
          label: 'ServiceAccounts',
          link: '/kubernetes/service-accounts'
        },
        {
          label: 'Detail',
          link: `/kubernetes/service-accounts/detail?name=${filter.name}&namespace${filter.namespace}&cluster${filter.clusterId}`
        }
      ]
    };
  }



}
