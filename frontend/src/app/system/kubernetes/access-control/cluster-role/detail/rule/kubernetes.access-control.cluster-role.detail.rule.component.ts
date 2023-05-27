import {Component, Input} from "@angular/core";

@Component({
  selector: 'app-kubernetes-access-control-cluster-role-detail-rule',
  templateUrl: './kubernetes.access-control.cluster-role.detail.rule.component.html'
})
export class KubernetesAccessControlClusterRoleDetailRuleComponent {

  @Input() rule!: any;

}
