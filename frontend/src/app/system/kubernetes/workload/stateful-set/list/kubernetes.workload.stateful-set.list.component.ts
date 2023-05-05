import {Component, OnInit} from "@angular/core";
import {HeaderService} from "../../../../../components/header/header.service";
import {KubernetesSupportList} from "../../../support/kubernetes.support.list";
import {Header} from "../../../../../components/header/header";
import {KubernetesWorkloadStatefulSetService} from "../kubernetes.workload.stateful-set.service";
import {KubernetesWorkloadStatefulSetList} from "../kubernetes.workload.stateful-set.list";

@Component({
  selector: 'app-kubernetes-workload-stateful-set-list',
  templateUrl: './kubernetes.workload.stateful-set.list.component.html'
})
export class KubernetesWorkloadStatefulSetListComponent extends KubernetesSupportList<KubernetesWorkloadStatefulSetList> implements OnInit {

  constructor(private replicaSetService: KubernetesWorkloadStatefulSetService,
              headerService: HeaderService) {
    super(headerService, replicaSetService);
  }

  getHeader(): Header {
    return {
      name: 'StatefulSet list',
      breadcrumbs: [
        {
          label: 'StatefulSets',
          link: '/kubernetes/stateful-sets'
        }
      ]
    };
  }

}
