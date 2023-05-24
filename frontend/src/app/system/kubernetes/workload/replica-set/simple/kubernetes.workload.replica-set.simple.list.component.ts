import {Component} from "@angular/core";
import {KubernetesWorkloadReplicaSetService} from "../kubernetes.workload.replica-set.service";
import {KubernetesWorkloadReplicaSetSimpleList} from "../kubernetes.workload.replica-set.simple.list";
import {KubernetesSupportSimpleList} from "../../../support/kubernetes.support.simple.list";

@Component({
  selector: 'app-kubernetes-workload-replica-set-simple-list',
  templateUrl: './kubernetes.workload.replica-set.simple.list.component.html'
})
export class KubernetesWorkloadReplicaSetSimpleListComponent extends KubernetesSupportSimpleList<KubernetesWorkloadReplicaSetSimpleList> {

  constructor(private replicaSetService: KubernetesWorkloadReplicaSetService) {
    super(replicaSetService);
  }

}
