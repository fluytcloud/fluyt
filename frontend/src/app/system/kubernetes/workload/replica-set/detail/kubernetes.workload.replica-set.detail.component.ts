import {Component, OnInit} from "@angular/core";
import {HeaderService} from "../../../../../components/header/header.service";
import {finalize} from "rxjs";
import {ActivatedRoute} from "@angular/router";
import {KubernetesSupportNamespaceObjectFilter} from "../../../support/kubernetes.support.namespace.object.filter";
import {KubernetesWorkloadReplicaSetService} from "../kubernetes.workload.replica-set.service";

@Component({
  selector: 'app-kubernetes-workload-replica-set-detail',
  templateUrl: './kubernetes.workload.replica-set.detail.component.html'
})
export class KubernetesWorkloadReplicaSetDetailComponent implements OnInit {

  display = false;
  replicaSet: any;

  constructor(private headerService: HeaderService,
              private activatedRoute: ActivatedRoute,
              private replicaSetService: KubernetesWorkloadReplicaSetService) {
  }

  ngOnInit(): void {
    const clusterId = this.activatedRoute.snapshot.queryParams['cluster']!;
    const name = this.activatedRoute.snapshot.queryParams['name']!;
    const namespace = this.activatedRoute.snapshot.queryParams['namespace']!;

    this.headerService.notifyHeader({
      name: `ReplicaSet ${name} details`,
      breadcrumbs: [
        {
          label: 'ReplicaSets',
          link: '/kubernetes/replica-sets'
        },
        {
          label: 'Detail',
          link: `/kubernetes/replica-sets/detail?name=${name}&namespace${namespace}&cluster${clusterId}`
        }
      ]
    });

    const filter = new KubernetesSupportNamespaceObjectFilter(clusterId, namespace, name);
    this.replicaSetService.get(filter)
      .pipe(finalize(() => this.display = true))
      .subscribe(replicaSet => {
        this.replicaSet = replicaSet;
      });
  }

}
