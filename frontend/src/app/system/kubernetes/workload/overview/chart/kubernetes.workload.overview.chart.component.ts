import {Component, Input} from "@angular/core";
import {KubernetesWorkloadOverviewChart} from "../kubernetes.workload.overview.chart";

@Component({
  selector: 'app-kubernetes-workload-overview-chart',
  templateUrl: './kubernetes.workload.overview.chart.component.html'
})
export class KubernetesWorkloadOverviewChartComponent {

  options = {
    cutout: '60%'
  };

  data: any;

  @Input() set value(charts: KubernetesWorkloadOverviewChart[]) {
    this.data = {
      labels: charts.map(it => it.type),
      datasets: [
        {
          data: charts.map(it => it.total)
        }
      ]
    };
  }

}
