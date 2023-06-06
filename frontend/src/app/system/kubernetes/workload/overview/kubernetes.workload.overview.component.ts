import {Component, OnInit} from "@angular/core";
import {KubernetesWorkloadOverviewService} from "./kubernetes.workload.overview.service";
import {KubernetesWorkloadOverview} from "./kubernetes.workload.overview";
import {finalize} from "rxjs";
import {HeaderService} from "../../../../components/header/header.service";
import {KubernetesSearch} from "../../search/kubernetes.search";

@Component({
  selector: 'app-kubernetes-workload-overview',
  templateUrl: './kubernetes.workload.overview.component.html'
})
export class KubernetesWorkloadOverviewComponent implements OnInit {

  overview?: KubernetesWorkloadOverview;
  display = false;

  search?: KubernetesSearch;

  constructor(private kubernetesWorkloadOverviewService: KubernetesWorkloadOverviewService,
              public headerService: HeaderService) {
  }

  ngOnInit(): void {
    this.headerService.notifyHeader({
      name: 'Workload overview',
      breadcrumbs: [
        {
          label: 'Overview',
          link: '/kubernetes/overview'
        }
      ]
    });
  }

  load(search: KubernetesSearch): void {
    this.search = search;
    this.overview = undefined;
    this.kubernetesWorkloadOverviewService.get(search)
      .pipe(finalize(() => this.display = true))
      .subscribe(overview => {
        this.overview = overview;
      });
  }

}
