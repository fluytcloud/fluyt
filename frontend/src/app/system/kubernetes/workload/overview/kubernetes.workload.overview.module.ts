import {NgModule} from "@angular/core";
import {KubernetesWorkloadOverviewComponent} from "./kubernetes.workload.overview.component";
import {CommonModule} from "@angular/common";
import {KubernetesWorkloadOverviewService} from "./kubernetes.workload.overview.service";
import {LoaderModule} from "../../../../components/loader/loader.module";
import {MatCardModule} from "@angular/material/card";
import {ChartModule} from "primeng/chart";
import {KubernetesWorkloadOverviewChartComponent} from "./chart/kubernetes.workload.overview.chart.component";

@NgModule({
  declarations: [
    KubernetesWorkloadOverviewComponent,
    KubernetesWorkloadOverviewChartComponent
  ],
  exports: [
    KubernetesWorkloadOverviewComponent,
    KubernetesWorkloadOverviewChartComponent
  ],
  imports: [
    CommonModule,
    LoaderModule,
    MatCardModule,
    ChartModule
  ],
  providers: [
    KubernetesWorkloadOverviewService
  ]
})
export class KubernetesWorkloadOverviewModule {

}
