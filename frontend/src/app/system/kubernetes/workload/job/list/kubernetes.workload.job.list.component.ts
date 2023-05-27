import {Component} from "@angular/core";
import {HeaderService} from "../../../../../components/header/header.service";
import {KubernetesSupportList} from "../../../support/kubernetes.support.list";
import {Header} from "../../../../../components/header/header";
import {KubernetesWorkloadJobList} from "../kubernetes.workload.job.list";
import {KubernetesWorkloadJobService} from "../kubernetes.workload.job.service";

@Component({
  selector: 'app-kubernetes-workload-job-list',
  templateUrl: './kubernetes.workload.job.list.component.html'
})
export class KubernetesWorkloadJobListComponent extends KubernetesSupportList<KubernetesWorkloadJobList> {

  constructor(private cronJobService: KubernetesWorkloadJobService,
              headerService: HeaderService) {
    super(headerService, cronJobService);
  }

  getHeader(): Header {
    return {
      name: 'Job list',
      breadcrumbs: [
        {
          label: 'Jobs',
          link: '/kubernetes/jobs'
        }
      ]
    };
  }

}
