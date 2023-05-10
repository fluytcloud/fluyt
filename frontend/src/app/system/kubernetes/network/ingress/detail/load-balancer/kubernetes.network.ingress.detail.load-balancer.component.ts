import {Component, Input} from "@angular/core";

@Component({
  selector: 'app-kubernetes-network-ingress-detail-load-balancer',
  templateUrl: './kubernetes.network.ingress.detail.load-balancer.component.html'
})
export class KubernetesNetworkIngressDetailLoadBalancerComponent {

  @Input() ingresses: any[] = [];

}
