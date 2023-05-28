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
import {PipesBytesModule} from "../../../../pipes/bytes/pipes.bytes.module";
import {KubernetesStorageStorageClassService} from "./kubernetes.storage.storage-class.service";
import {KubernetesStorageStorageClassListComponent} from "./list/kubernetes.storage.storage-class.list.component";
import {KubernetesStorageStorageClassDetailComponent} from "./detail/kubernetes.storage.storage-class.detail.component";
import {KubernetesComponentsActionsModule} from "../../components/action/kubernetes.components.actions.module";

@NgModule({
  declarations: [
    KubernetesStorageStorageClassListComponent,
    KubernetesStorageStorageClassDetailComponent
  ],
  exports: [
    KubernetesStorageStorageClassListComponent,
    KubernetesStorageStorageClassDetailComponent
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
        PipesBytesModule,
        KubernetesComponentsActionsModule
    ],
  providers: [
    KubernetesStorageStorageClassService
  ]
})
export class KubernetesStorageStorageClassModule {

}
