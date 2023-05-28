import {NgModule} from "@angular/core";
import {KubernetesComponentsActionsComponent} from "./kubernetes.components.actions.component";
import {CommonModule} from "@angular/common";
import {MatButtonModule} from "@angular/material/button";
import {MatIconModule} from "@angular/material/icon";
import {MatMenuModule} from "@angular/material/menu";
import {RouterModule} from "@angular/router";

@NgModule({
  declarations: [
    KubernetesComponentsActionsComponent
  ],
  exports: [
    KubernetesComponentsActionsComponent
  ],
  imports: [
    CommonModule,
    MatButtonModule,
    MatIconModule,
    MatMenuModule,
    RouterModule
  ]
})
export class KubernetesComponentsActionsModule {

}
