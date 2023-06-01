import {Component, Input} from "@angular/core";
import {KubernetesSupportService} from "../../support/kubernetes.support.service";
import {KubernetesSupportNamespaceObjectFilter} from "../../support/kubernetes.support.namespace.object.filter";
import {KubernetesEditorComponent} from "../../editor/kubernetes-editor.component";
import {MatDialog} from "@angular/material/dialog";
import {ConfirmationService, MessageService} from "primeng/api";

@Component({
  selector: 'app-kubernetes-components-action',
  templateUrl: './kubernetes.components.actions.component.html'
})
export class KubernetesComponentsActionsComponent {

  @Input() crudService!: KubernetesSupportService<any>;

  @Input() link!: string;

  @Input() object!: any;

  @Input() disableDetail = false;

  @Input() disableEdit = false;

  @Input() disableDelete = false;

  clusterId = sessionStorage.getItem("cluster");

  constructor(protected dialog: MatDialog,
              protected messageService: MessageService,
              protected confirmationService: ConfirmationService) {
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

  delete(): void {
    const filter = new KubernetesSupportNamespaceObjectFilter(Number(this.clusterId), this.object.namespace, this.object.name);

    this.confirmationService.confirm({
      message: `Are you sure you want to delete '${this.object.name}' ?`,
      closeOnEscape: false,
      accept: () => {
        this.crudService.delete(filter).subscribe({
          next: () => this.messageService.add({
            severity: 'info',
            summary: 'Info',
            detail: `'${this.object.name}' will be deleted`
          }),
          error: err => this.messageService.add({severity: 'error', summary: 'Error', detail: err?.error.message})
        });
      }
    });
  }
}
