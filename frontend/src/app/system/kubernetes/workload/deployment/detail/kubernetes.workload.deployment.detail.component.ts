import {Component} from "@angular/core";
import {KubernetesSupportDetail} from "../../../support/kubernetes.support.detail";
import {KubernetesWorkloadDeploymentList} from "../kubernetes.workload.deployment.list";
import {HeaderService} from "../../../../../components/header/header.service";
import {ActivatedRoute} from "@angular/router";
import {KubernetesSupportNamespaceObjectFilter} from "../../../support/kubernetes.support.namespace.object.filter";
import {Header} from "../../../../../components/header/header";
import {KubernetesWorkloadDeploymentService} from "../kubernetes.workload.deployment.service";

@Component({
  selector: 'app-kubernetes-workload-deployment-detail',
  templateUrl: './kubernetes.workload.deployment.detail.component.html'
})
export class KubernetesWorkloadDeploymentDetailComponent extends KubernetesSupportDetail<KubernetesWorkloadDeploymentList> {

  constructor(headerService: HeaderService,
              activatedRoute: ActivatedRoute,
              private deploymentService: KubernetesWorkloadDeploymentService) {
    super(headerService, activatedRoute, deploymentService);
  }

  getHeader(filter: KubernetesSupportNamespaceObjectFilter): Header {
    return {
      name: `Deployment ${filter.name} details`,
      breadcrumbs: [
        {
          label: 'Deployments',
          link: '/kubernetes/deployments'
        },
        {
          label: 'Detail',
          link: `/kubernetes/deployments/detail?name=${filter.name}&namespace${filter.namespace}&cluster${filter.clusterId}`
        }
      ]
    };
  }

}
