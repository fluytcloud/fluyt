import {Component} from "@angular/core";
import {KubernetesSupportSimpleList} from "../../../support/kubernetes.support.simple.list";
import {KubernetesWorkloadPodSimpleList} from "../kubernetes.workload.pod.simple.list";
import {KubernetesWorkloadPodService} from "../kubernetes.workload.pod.service";

@Component({
  selector: 'app-kubernetes-workload-pod-simple-list',
  templateUrl: './kubernetes.workload.pod.simple.list.component.html'
})
export class KubernetesWorkloadPodSimpleListComponent extends KubernetesSupportSimpleList<KubernetesWorkloadPodSimpleList> {

  constructor(private podService: KubernetesWorkloadPodService) {
    super(podService);
  }

}
