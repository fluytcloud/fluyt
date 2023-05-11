import {Component, Input} from "@angular/core";

@Component({
  selector: 'app-kubernetes-network-service-detail-connection',
  templateUrl: './kubernetes.network.service.detail.connection.component.html'
})
export class KubernetesNetworkServiceDetailConnectionComponent {

  @Input() connection!: any;
}
