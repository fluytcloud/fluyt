import {Component, OnInit} from "@angular/core";
import {HeaderService} from "../../../../../components/header/header.service";
import {KubernetesSupportList} from "../../../support/kubernetes.support.list";
import {Header} from "../../../../../components/header/header";
import {KubernetesConfigHorizontalPodAutoscalerList} from "../kubernetes.config.horizontal-pod-autoscaler.list";
import {KubernetesConfigHorizontalPodAutoscalerService} from "../kubernetes.config.horizontal-pod-autoscaler.service";

@Component({
  selector: 'app-kubernetes-config-horizontal-pod-autoscaler-list',
  templateUrl: './kubernetes.config.horizontal-pod-autoscaler.list.component.html'
})
export class KubernetesConfigHorizontalPodAutoscalerListComponent extends KubernetesSupportList<KubernetesConfigHorizontalPodAutoscalerList> implements OnInit {

  constructor(private horizontalPodAutoscalerService: KubernetesConfigHorizontalPodAutoscalerService,
              headerService: HeaderService) {
    super(headerService, horizontalPodAutoscalerService);
  }

  getHeader(): Header {
    return {
      name: 'HorizontalPodAutoscaler list',
      breadcrumbs: [
        {
          label: 'HorizontalPodAutoscalers',
          link: '/kubernetes/horizontal-pod-autoscalers'
        }
      ]
    };
  }

}
