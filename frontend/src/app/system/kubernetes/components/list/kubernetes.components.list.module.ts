import {NgModule} from "@angular/core";
import {KubernetesComponentsListComponent} from "./kubernetes.components.list.component";
import {CommonModule} from "@angular/common";
import {MatExpansionModule} from "@angular/material/expansion";
import {KubernetesSearchModule} from "../../search/kubernetes.search.module";
import {TableModule} from "primeng/table";

@NgModule({
  declarations: [
    KubernetesComponentsListComponent
  ],
  exports: [
    KubernetesComponentsListComponent
  ],
  imports: [
    CommonModule,
    MatExpansionModule,
    KubernetesSearchModule,
    TableModule
  ]
})
export class KubernetesComponentsListModule {

}
