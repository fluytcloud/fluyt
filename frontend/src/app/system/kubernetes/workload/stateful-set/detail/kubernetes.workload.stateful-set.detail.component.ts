import {Component} from "@angular/core";
import {HeaderService} from "../../../../../components/header/header.service";
import {ActivatedRoute} from "@angular/router";
import {KubernetesSupportNamespaceObjectFilter} from "../../../support/kubernetes.support.namespace.object.filter";
import {KubernetesSupportDetail} from "../../../support/kubernetes.support.detail";
import {Header} from "../../../../../components/header/header";
import {KubernetesWorkloadStatefulSetList} from "../kubernetes.workload.stateful-set.list";
import {KubernetesWorkloadStatefulSetService} from "../kubernetes.workload.stateful-set.service";

@Component({
  selector: 'app-kubernetes-workload-stateful-set-detail',
  templateUrl: './kubernetes.workload.stateful-set.detail.component.html'
})
export class KubernetesWorkloadStatefulSetDetailComponent extends KubernetesSupportDetail<KubernetesWorkloadStatefulSetList> {

  constructor(headerService: HeaderService,
              activatedRoute: ActivatedRoute,
              private statefulSetService: KubernetesWorkloadStatefulSetService) {
    super(headerService, activatedRoute, statefulSetService);
  }

  getHeader(filter: KubernetesSupportNamespaceObjectFilter): Header {
    return {
      name: `StatefulSet ${filter.name} details`,
      breadcrumbs: [
        {
          label: 'StatefulSets',
          link: '/kubernetes/stateful-sets'
        },
        {
          label: 'Detail',
          link: `/kubernetes/stateful-sets/detail?name=${filter.name}&namespace${filter.namespace}&cluster${filter.clusterId}`
        }
      ]
    };
  }

  override postGet(value: any) {
    this.addOwner(value?.metadata?.uid);
  }

}
