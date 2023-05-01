import {Component, OnInit} from "@angular/core";
import {HeaderService} from "../../../../../components/header/header.service";
import {KubernetesWorkloadPodService} from "../kubernetes.workload.pod.service";
import {finalize} from "rxjs";
import {ActivatedRoute} from "@angular/router";
import {KubernetesSupportNamespaceObjectFilter} from "../../../support/kubernetes.support.namespace.object.filter";

@Component({
  selector: 'app-kubernetes-workload-pod-detail',
  templateUrl: './kubernetes.workload.pod.detail.component.html'
})
export class KubernetesWorkloadPodDetailComponent implements OnInit {

  display = false;
  pod: any;

  constructor(private headerService: HeaderService,
              private activatedRoute: ActivatedRoute,
              private podService: KubernetesWorkloadPodService) {
  }

  ngOnInit(): void {
    const clusterId = this.activatedRoute.snapshot.queryParams['cluster']!;
    const name = this.activatedRoute.snapshot.queryParams['name']!;
    const namespace = this.activatedRoute.snapshot.queryParams['namespace']!;

    this.headerService.notifyHeader({
      name: `Pod ${name} details`,
      breadcrumbs: [
        {
          label: 'Pods',
          link: '/kubernetes/pods'
        },
        {
          label: 'Detail',
          link: `/kubernetes/pods/detail?name=${name}&namespace${namespace}&cluster${clusterId}`
        }
      ]
    });

    const filter = new KubernetesSupportNamespaceObjectFilter(clusterId, namespace, name);
    this.podService.get(filter)
      .pipe(finalize(() => this.display = true))
      .subscribe(pod => {
        this.pod = pod;
      });
  }

  getContainerStatusesByName(name: string): any {
    const containerStatuses: any[] = this.pod?.status?.containerStatuses;
    return containerStatuses.filter(it => it.name === name);
  }

}
