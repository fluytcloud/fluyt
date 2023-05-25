import {Component, Input} from "@angular/core";

@Component({
  selector: 'app-kubernetes-config-resource-quota-detail-quota',
  templateUrl: './kubernetes.config.resource-quota.detail.quota.components.html',
  styleUrls: ['./kubernetes.config.resource-quota.detail.quota.components.scss']
})
export class KubernetesConfigResourceQuotaDetailQuotaComponents {

  @Input() hard!: number;
  @Input() used!: number;
  @Input() type!: string;

}
