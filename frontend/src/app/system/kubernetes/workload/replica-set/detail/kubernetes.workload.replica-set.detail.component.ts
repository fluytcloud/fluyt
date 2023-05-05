import {Component} from "@angular/core";
import {HeaderService} from "../../../../../components/header/header.service";
import {ActivatedRoute} from "@angular/router";
import {KubernetesSupportNamespaceObjectFilter} from "../../../support/kubernetes.support.namespace.object.filter";
import {KubernetesWorkloadReplicaSetService} from "../kubernetes.workload.replica-set.service";
import {KubernetesSupportDetail} from "../../../support/kubernetes.support.detail";
import {KubernetesWorkloadReplicaSetList} from "../kubernetes.workload.replica-set.list";
import {Header} from "../../../../../components/header/header";

@Component({
  selector: 'app-kubernetes-workload-replica-set-detail',
  templateUrl: './kubernetes.workload.replica-set.detail.component.html'
})
export class KubernetesWorkloadReplicaSetDetailComponent extends KubernetesSupportDetail<KubernetesWorkloadReplicaSetList> {

  constructor(headerService: HeaderService,
              activatedRoute: ActivatedRoute,
              private replicaSetService: KubernetesWorkloadReplicaSetService) {
    super(headerService, activatedRoute, replicaSetService);
  }

  getHeader(filter: KubernetesSupportNamespaceObjectFilter): Header {
    return {
      name: `ReplicaSet ${filter.name} details`,
      breadcrumbs: [
        {
          label: 'ReplicaSets',
          link: '/kubernetes/replica-sets'
        },
        {
          label: 'Detail',
          link: `/kubernetes/replica-sets/detail?name=${filter.name}&namespace${filter.namespace}&cluster${filter.clusterId}`
        }
      ]
    };
  }



}
