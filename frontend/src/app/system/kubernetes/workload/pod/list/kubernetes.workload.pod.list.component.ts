import {Component, OnInit} from "@angular/core";
import {KubernetesWorkloadPodService} from "../kubernetes.workload.pod.service";
import {HeaderService} from "../../../../../components/header/header.service";
import {KubernetesWorkloadPodList} from "../kubernetes.workload.pod.list";
import {finalize} from "rxjs";
import {FooterService} from "../../../../../components/footer/footer.service";
import {KubernetesTerminalComponent} from "../../../terminal/kubernetes.terminal.component";
import {ActivatedRoute} from "@angular/router";
import {
  KubernetesSupportNamespaceObjectFilterList
} from "../../../support/kubernetes.support.namespace.object.filter.list";

@Component({
  selector: 'app-kubernetes-workload-pod-list',
  templateUrl: './kubernetes.workload.pod.list.component.html'
})
export class KubernetesWorkloadPodListComponent implements OnInit {

  pods: KubernetesWorkloadPodList[] = [];
  loading = true;
  clusterId!: number;

  constructor(private podService: KubernetesWorkloadPodService,
              private activatedRoute: ActivatedRoute,
              private headerService: HeaderService,
              private footerService: FooterService) {
  }

  ngOnInit(): void {
    this.clusterId = this.activatedRoute.snapshot.queryParams['cluster']!;

    this.headerService.notifyHeader({
      name: 'Pod list',
      breadcrumbs: [
        {
          label: 'Pods',
          link: '/kubernetes/pods'
        }
      ]
    });


    const filter = new KubernetesSupportNamespaceObjectFilterList(this.clusterId);
    this.podService.find(filter)
      .pipe(finalize(() => this.loading = false))
      .subscribe(pods => {
      this.pods = pods;
    });
  }


  openTerminal(pod: KubernetesWorkloadPodList): void {
    this.footerService.add({
      type: KubernetesTerminalComponent,
      title: 'Terminal',
      data: {
        title: 'Teste terminal'
      },
      icon: 'pi-desktop'
    })
  }
}
