import {Component, OnInit} from "@angular/core";
import {HeaderService} from "../../../../../components/header/header.service";
import {KubernetesSupportList} from "../../../support/kubernetes.support.list";
import {Header} from "../../../../../components/header/header";
import {KubernetesWorkloadCronJobList} from "../kubernetes.workload.cron-job.list";
import {KubernetesWorkloadCronJobService} from "../kubernetes.workload.cron-job.service";

@Component({
  selector: 'app-kubernetes-workload-cron-job-list',
  templateUrl: './kubernetes.workload.cron-job.list.component.html'
})
export class KubernetesWorkloadCronJobListComponent extends KubernetesSupportList<KubernetesWorkloadCronJobList> implements OnInit {

  constructor(private cronJobService: KubernetesWorkloadCronJobService,
              headerService: HeaderService) {
    super(headerService, cronJobService);
  }

  getHeader(): Header {
    return {
      name: 'CronJob list',
      breadcrumbs: [
        {
          label: 'CronJobs',
          link: '/kubernetes/cron-jobs'
        }
      ]
    };
  }

}
