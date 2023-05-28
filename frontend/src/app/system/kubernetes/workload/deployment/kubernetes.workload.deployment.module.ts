import {NgModule} from "@angular/core";
import {KubernetesWorkloadDeploymentService} from "./kubernetes.workload.deployment.service";
import {KubernetesComponentsListModule} from "../../components/list/kubernetes.components.list.module";
import {MatMenuModule} from "@angular/material/menu";
import {MatButtonModule} from "@angular/material/button";
import {MatIconModule} from "@angular/material/icon";
import {RouterModule} from "@angular/router";
import {LoaderModule} from "../../../../components/loader/loader.module";
import {MatExpansionModule} from "@angular/material/expansion";
import {FormContainerModule} from "../../../../components/form/container/form.container.module";
import {
  FormMultipleContainerModule
} from "../../../../components/form/multiple-container/form.multiple-container.module";
import {CommonModule, DatePipe, KeyValuePipe} from "@angular/common";
import {PipesReplicaSetReplicasModule} from "../../pipes/replica-set/replicas/pipes.replica-set.replicas.module";
import {TableModule} from "primeng/table";
import {KubernetesWorkloadDeploymentListComponent} from "./list/kubernetes.workload.deployment.list.component";
import {PipesDeploymentConditionModule} from "../../pipes/deployment/condition/pipes.deployment.condition.module";
import {TagModule} from "primeng/tag";
import {KubernetesWorkloadDeploymentDetailComponent} from "./detail/kubernetes.workload.deployment.detail.component";
import {MatChipsModule} from "@angular/material/chips";
import {KubernetesWorkloadPodModule} from "../pod/kubernetes.workload.pod.module";
import {MatDividerModule} from "@angular/material/divider";
import {KubernetesWorkloadReplicaSetModule} from "../replica-set/kubernetes.workload.replica-set.module";
import {KubernetesEventModule} from "../../events/kubernetes.event.module";
import {KubernetesComponentsActionsModule} from "../../components/action/kubernetes.components.actions.module";

@NgModule({
  declarations: [
    KubernetesWorkloadDeploymentListComponent,
    KubernetesWorkloadDeploymentDetailComponent
  ],
  exports: [
    KubernetesWorkloadDeploymentListComponent,
    KubernetesWorkloadDeploymentDetailComponent
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
        KeyValuePipe,
        PipesReplicaSetReplicasModule,
        TableModule,
        PipesDeploymentConditionModule,
        TagModule,
        MatChipsModule,
        KubernetesWorkloadPodModule,
        MatDividerModule,
        KubernetesWorkloadReplicaSetModule,
        KubernetesEventModule,
        KubernetesComponentsActionsModule,
    ],
  providers: [
    KubernetesWorkloadDeploymentService
  ]
})
export class KubernetesWorkloadDeploymentModule {

}
