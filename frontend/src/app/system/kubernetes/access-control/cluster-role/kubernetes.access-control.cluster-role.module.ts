import {NgModule} from "@angular/core";
import {CommonModule, DatePipe, KeyValuePipe} from "@angular/common";
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
import {MatChipsModule} from "@angular/material/chips";
import {PipesReplicaSetReplicasModule} from "../../pipes/replica-set/replicas/pipes.replica-set.replicas.module";
import {TableModule} from "primeng/table";
import {MatDividerModule} from "@angular/material/divider";
import {KubernetesAccessControlClusterRoleService} from "./kubernetes.access-control.cluster-role.service";
import {
  KubernetesAccessControlClusterRoleListComponent
} from "./list/kubernetes.access-control.cluster-role.list.component";
import {
  KubernetesAccessControlClusterRoleDetailComponent
} from "./detail/kubernetes.access-control.cluster-role.detail.component";
import {
  KubernetesAccessControlClusterRoleDetailRuleComponent
} from "./detail/rule/kubernetes.access-control.cluster-role.detail.rule.component";
import {KubernetesComponentsActionsModule} from "../../components/action/kubernetes.components.actions.module";

@NgModule({
  declarations: [
    KubernetesAccessControlClusterRoleListComponent,
    KubernetesAccessControlClusterRoleDetailComponent,
    KubernetesAccessControlClusterRoleDetailRuleComponent
  ],
  exports: [
    KubernetesAccessControlClusterRoleListComponent,
    KubernetesAccessControlClusterRoleDetailComponent,
    KubernetesAccessControlClusterRoleDetailRuleComponent
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
        MatDividerModule,
        KubernetesComponentsActionsModule
    ],
  providers: [
    KubernetesAccessControlClusterRoleService
  ]
})
export class KubernetesAccessControlClusterRoleModule {

}
