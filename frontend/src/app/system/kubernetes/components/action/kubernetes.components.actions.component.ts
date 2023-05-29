import {Component, Input} from "@angular/core";
import {KubernetesSupportService} from "../../support/kubernetes.support.service";
import {KubernetesSupportNamespaceObjectFilter} from "../../support/kubernetes.support.namespace.object.filter";
import {KubernetesEditorComponent} from "../../editor/kubernetes-editor.component";
import {MatDialog} from "@angular/material/dialog";

@Component({
  selector: 'app-kubernetes-components-action',
  templateUrl: './kubernetes.components.actions.component.html'
})
export class KubernetesComponentsActionsComponent {

  @Input() crudService!: KubernetesSupportService<any>;

  @Input() link!: string;

  @Input() object!: any;

  clusterId = sessionStorage.getItem("cluster");

  constructor(protected dialog: MatDialog) {
  }

  edit(): void {
    const filter = new KubernetesSupportNamespaceObjectFilter(Number(this.clusterId), this.object.namespace, this.object.name);

    this.dialog.open(KubernetesEditorComponent, {
      data: {
        filter: filter,
        service: this.crudService,
      }
    });
  }
}
