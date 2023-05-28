import {Component} from "@angular/core";
import {HeaderService} from "../../../../../components/header/header.service";
import {KubernetesSupportList} from "../../../support/kubernetes.support.list";
import {Header} from "../../../../../components/header/header";
import {KubernetesConfigResourceQuotaList} from "../kubernetes.config.resource-quota.list";
import {KubernetesConfigResourceQuotaService} from "../kubernetes.config.resource-quota.service";

@Component({
  selector: 'app-kubernetes-config-resource-quota-list',
  templateUrl: './kubernetes.config.resource-quota.list.component.html'
})
export class KubernetesConfigResourceQuotaListComponent extends KubernetesSupportList<KubernetesConfigResourceQuotaList> {

  constructor(private resourceQuotaService: KubernetesConfigResourceQuotaService,
              headerService: HeaderService) {
    super(headerService, resourceQuotaService);
  }

  getHeader(): Header {
    return {
      name: 'ResourceQuota list',
      breadcrumbs: [
        {
          label: 'ResourceQuotas',
          link: '/kubernetes/resource-quotas'
        }
      ]
    };
  }

}
