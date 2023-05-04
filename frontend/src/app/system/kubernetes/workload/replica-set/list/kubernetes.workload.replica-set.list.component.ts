import {Component, OnInit} from "@angular/core";
import {HeaderService} from "../../../../../components/header/header.service";
import {KubernetesSupportList} from "../../../support/kubernetes.support.list";
import {Header} from "../../../../../components/header/header";
import {KubernetesWorkloadReplicaSetList} from "../kubernetes.workload.replica-set.list";
import {KubernetesWorkloadReplicaSetService} from "../kubernetes.workload.replica-set.service";

@Component({
  selector: 'app-kubernetes-workload-replica-set-list',
  templateUrl: './kubernetes.workload.replica-set.list.component.html'
})
export class KubernetesWorkloadReplicaSetListComponent extends KubernetesSupportList<KubernetesWorkloadReplicaSetList> implements OnInit {

  constructor(private replicaSetService: KubernetesWorkloadReplicaSetService,
              headerService: HeaderService) {
    super(headerService, replicaSetService);
  }

  getHeader(): Header {
    return {
      name: 'ReplicaSet list',
      breadcrumbs: [
        {
          label: 'ReplicaSets',
          link: '/kubernetes/replica-sets'
        }
      ]
    };
  }

}
