import {Component, Input} from "@angular/core";

@Component({
  selector: 'app-kubernetes-workload-pod-detail-volume',
  templateUrl: './kubernetes.workload.pod.detail.volume.component.html'
})
export class KubernetesWorkloadPodDetailVolumeComponent {

  @Input() volume!: any;

}
