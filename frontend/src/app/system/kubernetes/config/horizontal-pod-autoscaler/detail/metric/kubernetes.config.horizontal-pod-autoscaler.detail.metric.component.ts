import {Component, Input} from "@angular/core";

@Component({
  selector: 'app-kubernetes-config-horizontal-pod-autoscaler-detail-metric',
  templateUrl: './kubernetes.config.horizontal-pod-autoscaler.detail.metric.component.html'
})
export class KubernetesConfigHorizontalPodAutoscalerDetailMetricComponent {

  @Input() specMetric!: any;

  @Input() currentMetric!: any;

}
