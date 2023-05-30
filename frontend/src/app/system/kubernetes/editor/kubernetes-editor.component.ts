import {Component, Inject, OnInit} from '@angular/core';
import {MAT_DIALOG_DATA, MatDialogRef} from "@angular/material/dialog";
import {KubernetesSupportService} from "../support/kubernetes.support.service";
import {KubernetesSupportNamespaceObjectFilter} from "../support/kubernetes.support.namespace.object.filter";
import {MessageService} from "primeng/api";

@Component({
  selector: 'app-kubernetes-editor',
  templateUrl: './kubernetes-editor.component.html',
  styleUrls: ['./kubernetes-editor.component.scss']
})
export class KubernetesEditorComponent implements OnInit {

  codemirrorValue = '';
  codeMirrorConfig = {
    theme: 'material',
    lineNumbers: true,
  };

  constructor(@Inject(MAT_DIALOG_DATA) protected data: EditorData,
              protected dialogRef: MatDialogRef<KubernetesEditorComponent>,
              protected messageService: MessageService) {

    this.dialogRef.afterClosed().subscribe(() => {
      this.codemirrorValue = '';
      this.data = {} as EditorData;
    })
  }

  ngOnInit(): void {
    this.dialogRef.updateSize('55vw');
    this.data.service.getYaml(this.data.filter)
      .subscribe(r => this.codemirrorValue = r);
  }

  apply(): void {
    this.data.service.edit(this.data.filter, this.codemirrorValue)
      .subscribe(() => {
        this.messageService.add({severity: 'success', summary: 'Success', detail: 'Changes were successfully applied'});
        this.dialogRef.close();
      });
  }
}

export interface EditorData {
  filter: KubernetesSupportNamespaceObjectFilter,
  service: KubernetesSupportService<any>,
}
