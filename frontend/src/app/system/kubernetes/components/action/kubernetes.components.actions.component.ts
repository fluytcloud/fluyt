import {Component, Input} from "@angular/core";
import {KubernetesSupportService} from "../../support/kubernetes.support.service";

@Component({
  selector: 'app-kubernetes-components-action',
  templateUrl: './kubernetes.components.actions.component.html'
})
export class KubernetesComponentsActionsComponent {

  @Input() crudService!: KubernetesSupportService<any>;

  @Input() link!: string;

  @Input() object!: any;

  clusterId = sessionStorage.getItem("cluster");

}
