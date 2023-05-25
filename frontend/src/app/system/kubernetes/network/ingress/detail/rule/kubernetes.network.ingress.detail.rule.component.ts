import {Component, Input} from "@angular/core";

@Component({
  selector: 'app-kubernetes-network-ingress-detail-rule',
  templateUrl: './kubernetes.network.ingress.detail.rule.component.html'
})
export class KubernetesNetworkIngressDetailRuleComponent {

  paths: any[] = [];

  @Input() set rules(rules: any[]) {
    if (rules) {
      this.paths = rules.flatMap(rule => rule?.http?.paths);
    }
  }

}
