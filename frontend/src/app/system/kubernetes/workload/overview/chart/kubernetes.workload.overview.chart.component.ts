import {Component, Input, OnInit} from "@angular/core";
import {KubernetesWorkloadOverviewChart} from "../kubernetes.workload.overview.chart";

@Component({
  selector: 'app-kubernetes-workload-overview-chart',
  templateUrl: './kubernetes.workload.overview.chart.component.html',
  styleUrls: ['./kubernetes.workload.overview.chart.component.scss']
})
export class KubernetesWorkloadOverviewChartComponent implements OnInit {

  options = {
    cutout: '60%',
    plugins: {
      legend: {
        position: 'bottom'
      }
    }
  };

  data: any;

  sum?: number;

  @Input() value!: KubernetesWorkloadOverviewChart[];

  @Input() label!: string;

  colors = {
    "Succeeded": "#0288D1",
    "Scheduled": "#0288D1",
    "Running": "#388E3C",
    "Active": "#388E3C",
    "Pending": "#FBC02D",
    "Failed": "#D32F2F"
  } as any;

  ngOnInit(): void {
    const backgroundColors = this.value.map(it => this.colors[it.type]);

    this.data = {
      labels: this.value.map(it => it.type),
      datasets: [
        {
          data: this.value.map(it => it.total),
          backgroundColor: backgroundColors
        }
      ]
    };

    this.sum = this.value.map(it => it.total)
      .reduce((sum, current) => sum + current, 0);

  }


}
