import {Component, Input} from "@angular/core";
import {KubernetesSupportSimpleList} from "../../../support/kubernetes.support.simple.list";
import {KubernetesSearch} from "../../../search/kubernetes.search";
import {KubernetesWorkloadPodSimpleList} from "../kubernetes.workload.pod.simple.list";
import {KubernetesWorkloadPodService} from "../kubernetes.workload.pod.service";

@Component({
  selector: 'app-kubernetes-workload-pod-simple-list',
  templateUrl: './kubernetes.workload.pod.simple.list.component.html'
})
export class KubernetesWorkloadPodSimpleListComponent extends KubernetesSupportSimpleList<KubernetesWorkloadPodSimpleList> {

  @Input() filter!: KubernetesSearch;
  constructor(private podService: KubernetesWorkloadPodService) {
    super(podService);
  }

  override getFilter(): KubernetesSearch {
    return this.filter;
  }

}
