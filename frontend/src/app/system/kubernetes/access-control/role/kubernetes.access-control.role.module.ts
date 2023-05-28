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
import {KubernetesAccessControlRoleService} from "./kubernetes.access-control.role.service";
import {KubernetesAccessControlRoleDetailComponent} from "./detail/kubernetes.access-control.role.detail.component";
import {KubernetesAccessControlRoleListComponent} from "./list/kubernetes.access-control.role.list.component";
import {
  KubernetesAccessControlRoleDetailRuleComponent
} from "./detail/rule/kubernetes.access-control.role.detail.rule.component";
import {MatDividerModule} from "@angular/material/divider";
import {KubernetesComponentsActionsModule} from "../../components/action/kubernetes.components.actions.module";

@NgModule({
  declarations: [
    KubernetesAccessControlRoleDetailComponent,
    KubernetesAccessControlRoleListComponent,
    KubernetesAccessControlRoleDetailRuleComponent
  ],
  exports: [
    KubernetesAccessControlRoleDetailComponent,
    KubernetesAccessControlRoleListComponent,
    KubernetesAccessControlRoleDetailRuleComponent
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
    KubernetesAccessControlRoleService
  ]
})
export class KubernetesAccessControlRoleModule {

}
