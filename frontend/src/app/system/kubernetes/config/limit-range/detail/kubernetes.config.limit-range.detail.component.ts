import {Component} from "@angular/core";
import {HeaderService} from "../../../../../components/header/header.service";
import {ActivatedRoute} from "@angular/router";
import {KubernetesSupportNamespaceObjectFilter} from "../../../support/kubernetes.support.namespace.object.filter";
import {KubernetesSupportDetail} from "../../../support/kubernetes.support.detail";
import {Header} from "../../../../../components/header/header";
import {KubernetesConfigLimitRangeList} from "../kubernetes.config.limit-range.list";
import {KubernetesConfigLimitRangeService} from "../kubernetes.config.limit-range.service";

@Component({
  selector: 'app-kubernetes-config-limit-range-detail',
  templateUrl: './kubernetes.config.limit-range.detail.component.html'
})
export class KubernetesConfigLimitRangeDetailComponent extends KubernetesSupportDetail<KubernetesConfigLimitRangeList> {

  status?: string[];

  constructor(headerService: HeaderService,
              activatedRoute: ActivatedRoute,
              private limitRangeService: KubernetesConfigLimitRangeService) {
    super(headerService, activatedRoute, limitRangeService);
  }

  getHeader(filter: KubernetesSupportNamespaceObjectFilter): Header {
    return {
      name: `LimitRange ${filter.name} details`,
      breadcrumbs: [
        {
          label: 'LimitRanges',
          link: '/kubernetes/limit-ranges'
        },
        {
          label: 'Detail',
          link: `/kubernetes/limit-ranges/detail?name=${filter.name}&namespace=${filter.namespace}&cluster=${filter.clusterId}`
        }
      ]
    };
  }

  override postGet(value: any) {
    const conditions: any[] = value?.status?.conditions;
    this.status = conditions
      .filter(it => 'True' === it.status)
      .map(it => it.type);
  }

  getCurrentMetricByResourceName(name: string): any {
    const currentMetrics: any[] = this.value?.status?.currentMetrics;
    return currentMetrics?.filter(it => it.resource.name === name);
  }

}
