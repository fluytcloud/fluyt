import {NgModule} from '@angular/core';
import {CommonModule} from '@angular/common';
import {KubernetesEditorComponent} from "./kubernetes-editor.component";
import {MatDialogModule} from "@angular/material/dialog";
import {CodemirrorModule} from "@ctrl/ngx-codemirror";
import {FormsModule} from "@angular/forms";
import {MatButtonModule} from "@angular/material/button";

@NgModule({
  declarations: [
    KubernetesEditorComponent,
  ],
  exports: [
    KubernetesEditorComponent,
  ],
  imports: [
    CommonModule,
    MatDialogModule,
    CodemirrorModule,
    FormsModule,
    MatButtonModule,
  ]
})
export class KubernetesEditorModule {
}
