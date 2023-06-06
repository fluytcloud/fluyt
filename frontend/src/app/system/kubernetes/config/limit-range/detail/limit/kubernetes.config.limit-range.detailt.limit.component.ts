import {Component, Input} from "@angular/core";

@Component({
  selector: 'app-kubernetes-config-limit-range-detail-limit',
  templateUrl: './kubernetes.config.limit-range.detailt.limit.component.html',
  styleUrls: ['./kubernetes.config.limit-range.detailt.limit.component.scss']
})
export class KubernetesConfigLimitRangeDetailtLimitComponent {

  @Input() limit!: any;

}
