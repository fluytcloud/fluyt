import {NgModule} from "@angular/core";
import {KubernetesWorkloadReplicaSetService} from "./kubernetes.workload.replica-set.service";
import {KubernetesWorkloadReplicaSetListComponent} from "./list/kubernetes.workload.replica-set.list.component";
import {KubernetesComponentsListModule} from "../../components/list/kubernetes.components.list.module";
import {MatMenuModule} from "@angular/material/menu";
import {MatButtonModule} from "@angular/material/button";
import {MatIconModule} from "@angular/material/icon";
import {RouterModule} from "@angular/router";
import {KubernetesWorkloadReplicaSetDetailComponent} from "./detail/kubernetes.workload.replica-set.detail.component";
import {LoaderModule} from "../../../../components/loader/loader.module";
import {MatExpansionModule} from "@angular/material/expansion";
import {FormContainerModule} from "../../../../components/form/container/form.container.module";
import {
  FormMultipleContainerModule
} from "../../../../components/form/multiple-container/form.multiple-container.module";
import {CommonModule, DatePipe, KeyValuePipe} from "@angular/common";
import {MatChipsModule} from "@angular/material/chips";
import {PipesReplicaSetReplicasModule} from "../../pipes/replica-set/replicas/pipes.replica-set.replicas.module";
import {TableModule} from "primeng/table";
import {
  KubernetesWorkloadReplicaSetSimpleListComponent
} from "./simple/kubernetes.workload.replica-set.simple.list.component";
import {
  KubernetesComponentsSimpleListModule
} from "../../components/list/simple/kubernetes.components.simple.list.module";
import {KubernetesWorkloadPodModule} from "../pod/kubernetes.workload.pod.module";
import {KubernetesEventModule} from "../../events/kubernetes.event.module";
import {KubernetesComponentsActionsModule} from "../../components/action/kubernetes.components.actions.module";

@NgModule({
  declarations: [
    KubernetesWorkloadReplicaSetListComponent,
    KubernetesWorkloadReplicaSetDetailComponent,
    KubernetesWorkloadReplicaSetSimpleListComponent
  ],
  exports: [
    KubernetesWorkloadReplicaSetListComponent,
    KubernetesWorkloadReplicaSetDetailComponent,
    KubernetesWorkloadReplicaSetSimpleListComponent
  ],
    imports: [
        CommonModule,
        KubernetesComponentsListModule,
        MatMenuModule,
        MatButtonModule,
        MatIconModule,
        RouterModule,
        LoaderModule,
        MatExpansionModule,
        FormContainerModule,
        FormMultipleContainerModule,
        DatePipe,
        MatChipsModule,
        KeyValuePipe,
        PipesReplicaSetReplicasModule,
        TableModule,
        KubernetesComponentsSimpleListModule,
        KubernetesWorkloadPodModule,
        KubernetesEventModule,
        KubernetesComponentsActionsModule
    ],
  providers: [
    KubernetesWorkloadReplicaSetService
  ]
})
export class KubernetesWorkloadReplicaSetModule {

}
