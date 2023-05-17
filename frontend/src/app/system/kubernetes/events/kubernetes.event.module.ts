import {NgModule} from "@angular/core";
import {CommonModule} from "@angular/common";
import {KubernetesEventService} from "./kubernetes.event.service";
import {KubernetesEventSimpleListComponent} from "./simple/kubernetes.event.simple.list.component";
import {KubernetesWorkloadReplicaSetModule} from "../workload/replica-set/kubernetes.workload.replica-set.module";
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
    KubernetesWorkloadReplicaSetModule,
    MatExpansionModule,
    FormContainerModule
  ],
  providers: [
    KubernetesEventService
  ]
})
export class KubernetesEventModule {

}
