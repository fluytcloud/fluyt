import {Component} from "@angular/core";
import {HeaderService} from "../../../../../components/header/header.service";
import {ActivatedRoute} from "@angular/router";
import {KubernetesSupportNamespaceObjectFilter} from "../../../support/kubernetes.support.namespace.object.filter";
import {KubernetesSupportDetail} from "../../../support/kubernetes.support.detail";
import {Header} from "../../../../../components/header/header";
import {KubernetesWorkloadJobService} from "../kubernetes.workload.job.service";
import {KubernetesWorkloadJobList} from "../kubernetes.workload.job.list";

@Component({
  selector: 'app-kubernetes-workload-job-detail',
  templateUrl: './kubernetes.workload.job.detail.component.html'
})
export class KubernetesWorkloadJobDetailComponent extends KubernetesSupportDetail<KubernetesWorkloadJobList> {

  constructor(headerService: HeaderService,
              activatedRoute: ActivatedRoute,
              private daemonSetService: KubernetesWorkloadJobService) {
    super(headerService, activatedRoute, daemonSetService);
  }

  getHeader(filter: KubernetesSupportNamespaceObjectFilter): Header {
    return {
      name: `Job ${filter.name} details`,
      breadcrumbs: [
        {
          label: 'Jobs',
          link: '/kubernetes/jobs'
        },
        {
          label: 'Detail',
          link: `/kubernetes/jobs/detail?name=${filter.name}&namespace${filter.namespace}&cluster${filter.clusterId}`
        }
      ]
    };
  }

  override postGet(value: any) {
    this.addOwner(value?.metadata?.uid);
  }

}
