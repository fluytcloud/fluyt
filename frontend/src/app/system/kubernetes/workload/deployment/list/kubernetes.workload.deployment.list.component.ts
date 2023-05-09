import {Component, OnInit} from "@angular/core";
import {KubernetesSupportList} from "../../../support/kubernetes.support.list";
import {HeaderService} from "../../../../../components/header/header.service";
import {Header} from "../../../../../components/header/header";
import {KubernetesWorkloadDeploymentService} from "../kubernetes.workload.deployment.service";
import {KubernetesWorkloadDeploymentList} from "../kubernetes.workload.deployment.list";

@Component({
  selector: 'app-kubernetes-workload-deployment-list',
  templateUrl: './kubernetes.workload.deployment.list.component.html'
})
export class KubernetesWorkloadDeploymentListComponent extends KubernetesSupportList<KubernetesWorkloadDeploymentList> implements OnInit {

  constructor(private deploymentService: KubernetesWorkloadDeploymentService, headerService: HeaderService) {
    super(headerService, deploymentService);
  }

  getHeader(): Header {
    return {
      name: 'Deployment list',
      breadcrumbs: [
        {
          label: 'Deployments',
          link: '/kubernetes/deployments'
        }
      ]
    };
  }

}
