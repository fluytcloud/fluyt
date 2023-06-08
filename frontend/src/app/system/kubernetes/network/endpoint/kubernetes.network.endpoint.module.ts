import {NgModule} from "@angular/core";
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
import {MatChipsModule} from "@angular/material/chips";
import {TableModule} from "primeng/table";
import {MatDividerModule} from "@angular/material/divider";
import {KubernetesNetworkEndpointService} from "./kubernetes.network.endpoint.service";
import {KubernetesNetworkEndpointListComponent} from "./list/kubernetes.network.endpoint.list.component";
import {KubernetesNetworkEndpointDetailComponent} from "./detail/kubernetes.network.endpoint.detail.component";
import {KubernetesComponentsActionsModule} from "../../components/action/kubernetes.components.actions.module";

@NgModule({
  declarations: [
    KubernetesNetworkEndpointListComponent,
    KubernetesNetworkEndpointDetailComponent
  ],
  exports: [
    KubernetesNetworkEndpointListComponent,
    KubernetesNetworkEndpointDetailComponent
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
        KubernetesComponentsActionsModule
    ],
  providers: [
    KubernetesNetworkEndpointService
  ]
})
export class KubernetesNetworkEndpointModule {

}
