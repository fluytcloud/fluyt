import {Component} from "@angular/core";
import {HeaderService} from "../../../../../components/header/header.service";
import {ActivatedRoute} from "@angular/router";
import {KubernetesSupportNamespaceObjectFilter} from "../../../support/kubernetes.support.namespace.object.filter";
import {KubernetesSupportDetail} from "../../../support/kubernetes.support.detail";
import {Header} from "../../../../../components/header/header";
import {KubernetesConfigResourceQuotaList} from "../kubernetes.config.resource-quota.list";
import {KubernetesConfigResourceQuotaService} from "../kubernetes.config.resource-quota.service";

@Component({
  selector: 'app-kubernetes-config-resource-quota-detail',
  templateUrl: './kubernetes.config.resource-quota.detail.component.html'
})
export class KubernetesConfigResourceQuotaDetailComponent extends KubernetesSupportDetail<KubernetesConfigResourceQuotaList> {


  constructor(headerService: HeaderService,
              activatedRoute: ActivatedRoute,
              private resourceQuotaService: KubernetesConfigResourceQuotaService) {
    super(headerService, activatedRoute, resourceQuotaService);
  }

  getHeader(filter: KubernetesSupportNamespaceObjectFilter): Header {
    return {
      name: `ResourceQuota ${filter.name} details`,
      breadcrumbs: [
        {
          label: 'ResourceQuotas',
          link: '/kubernetes/resource-quotas'
        },
        {
          label: 'Detail',
          link: `/kubernetes/resource-quotas/detail?name=${filter.name}&namespace=${filter.namespace}&cluster=${filter.clusterId}`
        }
      ]
    };
  }

}
