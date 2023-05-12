import {NgModule} from "@angular/core";
import {KubernetesComponentsSimpleListComponent} from "./kubernetes.components.simple.list.component";
import {CommonModule} from "@angular/common";
import {MatExpansionModule} from "@angular/material/expansion";
import {TableModule} from "primeng/table";

@NgModule({
  declarations: [
    KubernetesComponentsSimpleListComponent
  ],
  exports: [
    KubernetesComponentsSimpleListComponent
  ],
  imports: [
    CommonModule,
    MatExpansionModule,
    TableModule
  ]
})
export class KubernetesComponentsSimpleListModule {

}
