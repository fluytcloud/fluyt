import {NgModule} from "@angular/core";
import {CommonModule, DatePipe, KeyValuePipe} from "@angular/common";
import {MatMenuModule} from "@angular/material/menu";
import {MatButtonModule} from "@angular/material/button";
import {MatIconModule} from "@angular/material/icon";
import {RouterModule} from "@angular/router";
import {MatExpansionModule} from "@angular/material/expansion";
import {MatChipsModule} from "@angular/material/chips";
import {TableModule} from "primeng/table";
import {MatDividerModule} from "@angular/material/divider";
import {KubernetesNodeService} from "./kubernetes.node.service";
import {KubernetesNodeListComponent} from "./list/kubernetes.node.list.component";
import {KubernetesNodeDetailComponent} from "./detail/kubernetes.node.detail.component";
import {KubernetesComponentsListModule} from "../components/list/kubernetes.components.list.module";
import {LoaderModule} from "../../../components/loader/loader.module";
import {FormContainerModule} from "../../../components/form/container/form.container.module";
import {FormMultipleContainerModule} from "../../../components/form/multiple-container/form.multiple-container.module";
import {KubernetesComponentsActionsModule} from "../components/action/kubernetes.components.actions.module";
import {PipesBytesModule} from "../../../pipes/bytes/pipes.bytes.module";
import {KubernetesEventModule} from "../events/kubernetes.event.module";

@NgModule({
  declarations: [
    KubernetesNodeListComponent,
    KubernetesNodeDetailComponent
  ],
  exports: [
    KubernetesNodeListComponent,
    KubernetesNodeDetailComponent
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
    TableModule,
    MatDividerModule,
    KubernetesComponentsActionsModule,
    PipesBytesModule,
    KubernetesEventModule
  ],
  providers: [
    KubernetesNodeService
  ]
})
export class KubernetesNodeModule {

}
