import {Component, Input} from "@angular/core";

@Component({
  selector: 'app-kubernetes-workload-pod-detail-container',
  templateUrl: './kubernetes.workload.pod.detail.container.component.html'
})
export class KubernetesWorkloadPodDetailContainerComponent {

  @Input() container!: any;

  @Input() containerStatuses!: any;

}
