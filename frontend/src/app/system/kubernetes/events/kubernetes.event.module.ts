import {NgModule} from "@angular/core";
import {CommonModule} from "@angular/common";
import {KubernetesEventService} from "./kubernetes.event.service";
import {KubernetesEventSimpleListComponent} from "./simple/kubernetes.event.simple.list.component";
import {MatExpansionModule} from "@angular/material/expansion";
import {FormContainerModule} from "../../../components/form/container/form.container.module";

@NgModule({
  declarations: [
    KubernetesEventSimpleListComponent
  ],
  exports: [
    KubernetesEventSimpleListComponent
  ],
  imports: [
    CommonModule,
    MatExpansionModule,
    FormContainerModule
  ],
  providers: [
    KubernetesEventService
  ]
})
export class KubernetesEventModule {

}
