import {Component, Input} from "@angular/core";

@Component({
  selector: 'app-kubernetes-access-control-role-detail-rule',
  templateUrl: './kubernetes.access-control.role.detail.rule.component.html'
})
export class KubernetesAccessControlRoleDetailRuleComponent {

  @Input() rule!: any;

}
