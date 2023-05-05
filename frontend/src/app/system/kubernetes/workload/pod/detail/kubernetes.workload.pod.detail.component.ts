import {Component} from "@angular/core";
import {HeaderService} from "../../../../../components/header/header.service";
import {KubernetesWorkloadPodService} from "../kubernetes.workload.pod.service";
import {ActivatedRoute} from "@angular/router";
import {KubernetesSupportNamespaceObjectFilter} from "../../../support/kubernetes.support.namespace.object.filter";
import {KubernetesSupportDetail} from "../../../support/kubernetes.support.detail";
import {KubernetesWorkloadPodList} from "../kubernetes.workload.pod.list";
import {Header} from "../../../../../components/header/header";

@Component({
  selector: 'app-kubernetes-workload-pod-detail',
  templateUrl: './kubernetes.workload.pod.detail.component.html'
})
export class KubernetesWorkloadPodDetailComponent extends KubernetesSupportDetail<KubernetesWorkloadPodList> {

  constructor(headerService: HeaderService,
              activatedRoute: ActivatedRoute,
              private podService: KubernetesWorkloadPodService) {
    super(headerService, activatedRoute, podService)
  }

  getHeader(filter: KubernetesSupportNamespaceObjectFilter): Header {
    return {
      name: `Pod ${filter.name} details`,
      breadcrumbs: [
        {
          label: 'Pods',
          link: '/kubernetes/pods'
        },
        {
          label: 'Detail',
          link: `/kubernetes/pods/detail?name=${filter.name}&namespace${filter.namespace}&cluster${filter.clusterId}`
        }
      ]
    };
  }

  getContainerStatusesByName(name: string): any {
    const containerStatuses: any[] = this.value?.status?.containerStatuses;
    return containerStatuses.filter(it => it.name === name);
  }

}
