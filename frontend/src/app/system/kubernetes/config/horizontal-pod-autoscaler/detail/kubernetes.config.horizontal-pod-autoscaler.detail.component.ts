import {Component} from "@angular/core";
import {HeaderService} from "../../../../../components/header/header.service";
import {ActivatedRoute} from "@angular/router";
import {KubernetesSupportNamespaceObjectFilter} from "../../../support/kubernetes.support.namespace.object.filter";
import {KubernetesSupportDetail} from "../../../support/kubernetes.support.detail";
import {Header} from "../../../../../components/header/header";
import {KubernetesConfigHorizontalPodAutoscalerList} from "../kubernetes.config.horizontal-pod-autoscaler.list";
import {KubernetesConfigHorizontalPodAutoscalerService} from "../kubernetes.config.horizontal-pod-autoscaler.service";

@Component({
  selector: 'app-kubernetes-config-horizontal-pod-autoscaler-detail',
  templateUrl: './kubernetes.config.horizontal-pod-autoscaler.detail.component.html'
})
export class KubernetesConfigHorizontalPodAutoscalerDetailComponent extends KubernetesSupportDetail<KubernetesConfigHorizontalPodAutoscalerList> {

  status?: string[];

  constructor(headerService: HeaderService,
              activatedRoute: ActivatedRoute,
              private horizontalPodAutoscalerService: KubernetesConfigHorizontalPodAutoscalerService) {
    super(headerService, activatedRoute, horizontalPodAutoscalerService);
  }

  getHeader(filter: KubernetesSupportNamespaceObjectFilter): Header {
    return {
      name: `HorizontalPodAutoscaler ${filter.name} details`,
      breadcrumbs: [
        {
          label: 'HorizontalPodAutoscalers',
          link: '/kubernetes/horizontal-pod-autoscalers'
        },
        {
          label: 'Detail',
          link: `/kubernetes/horizontal-pod-autoscalers/detail?name=${filter.name}&namespace=${filter.namespace}&cluster=${filter.clusterId}`
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
