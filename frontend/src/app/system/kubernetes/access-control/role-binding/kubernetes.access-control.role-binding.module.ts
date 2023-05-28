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
import {
  KubernetesAccessControlRoleBindingListComponent
} from "./list/kubernetes.access-control.role-binding.list.component";
import {KubernetesAccessControlRoleBindingService} from "./kubernetes.access-control.role-binding.service";
import {
  KubernetesAccessControlRoleBindingDetailComponent
} from "./detail/kubernetes.access-control.role-binding.detail.component";
import {KubernetesComponentsActionsModule} from "../../components/action/kubernetes.components.actions.module";

@NgModule({
  declarations: [
    KubernetesAccessControlRoleBindingListComponent,
    KubernetesAccessControlRoleBindingDetailComponent
  ],
  exports: [
    KubernetesAccessControlRoleBindingListComponent,
    KubernetesAccessControlRoleBindingDetailComponent
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
        KubernetesComponentsActionsModule
    ],
  providers: [
    KubernetesAccessControlRoleBindingService
  ]
})
export class KubernetesAccessControlRoleBindingModule {

}
