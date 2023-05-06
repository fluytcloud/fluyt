import {Component} from "@angular/core";
import {HeaderService} from "../../../../../components/header/header.service";
import {ActivatedRoute} from "@angular/router";
import {KubernetesSupportNamespaceObjectFilter} from "../../../support/kubernetes.support.namespace.object.filter";
import {KubernetesSupportDetail} from "../../../support/kubernetes.support.detail";
import {Header} from "../../../../../components/header/header";
import {KubernetesWorkloadDaemonSetList} from "../kubernetes.workload.daemon-set.list";
import {KubernetesWorkloadDaemonSetService} from "../kubernetes.workload.daemon-set.service";

@Component({
  selector: 'app-kubernetes-workload-daemon-set-detail',
  templateUrl: './kubernetes.workload.daemon-set.detail.component.html'
})
export class KubernetesWorkloadDaemonSetDetailComponent extends KubernetesSupportDetail<KubernetesWorkloadDaemonSetList> {

  constructor(headerService: HeaderService,
              activatedRoute: ActivatedRoute,
              private daemonSetService: KubernetesWorkloadDaemonSetService) {
    super(headerService, activatedRoute, daemonSetService);
  }

  getHeader(filter: KubernetesSupportNamespaceObjectFilter): Header {
    return {
      name: `DaemonSet ${filter.name} details`,
      breadcrumbs: [
        {
          label: 'DaemonSets',
          link: '/kubernetes/daemon-sets'
        },
        {
          label: 'Detail',
          link: `/kubernetes/daemon-sets/detail?name=${filter.name}&namespace${filter.namespace}&cluster${filter.clusterId}`
        }
      ]
    };
  }



}
