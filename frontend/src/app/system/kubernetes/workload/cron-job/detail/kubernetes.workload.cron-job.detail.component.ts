import {Component} from "@angular/core";
import {HeaderService} from "../../../../../components/header/header.service";
import {ActivatedRoute} from "@angular/router";
import {KubernetesSupportNamespaceObjectFilter} from "../../../support/kubernetes.support.namespace.object.filter";
import {KubernetesSupportDetail} from "../../../support/kubernetes.support.detail";
import {Header} from "../../../../../components/header/header";
import {KubernetesWorkloadCronJobService} from "../kubernetes.workload.cron-job.service";
import {KubernetesWorkloadCronJobList} from "../kubernetes.workload.cron-job.list";

@Component({
  selector: 'app-kubernetes-workload-cron-job-detail',
  templateUrl: './kubernetes.workload.cron-job.detail.component.html'
})
export class KubernetesWorkloadCronJobDetailComponent extends KubernetesSupportDetail<KubernetesWorkloadCronJobList> {

  constructor(headerService: HeaderService,
              activatedRoute: ActivatedRoute,
              private daemonSetService: KubernetesWorkloadCronJobService) {
    super(headerService, activatedRoute, daemonSetService);
  }

  getHeader(filter: KubernetesSupportNamespaceObjectFilter): Header {
    return {
      name: `CronJob ${filter.name} details`,
      breadcrumbs: [
        {
          label: 'CronJobs',
          link: '/kubernetes/cron-jobs'
        },
        {
          label: 'Detail',
          link: `/kubernetes/cron-jobs/detail?name=${filter.name}&namespace${filter.namespace}&cluster${filter.clusterId}`
        }
      ]
    };
  }

}
