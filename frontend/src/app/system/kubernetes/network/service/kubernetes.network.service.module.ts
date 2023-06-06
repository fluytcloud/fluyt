import {NgModule} from "@angular/core";
import {CommonModule} from "@angular/common";
import {KubernetesNetworkServiceService} from "./kubernetes.network.service.service";
import {KubernetesNetworkServiceListComponent} from "./list/kubernetes.network.service.list.component";
import {KubernetesComponentsListModule} from "../../components/list/kubernetes.components.list.module";
import {MatMenuModule} from "@angular/material/menu";
import {MatIconModule} from "@angular/material/icon";
import {RouterLink} from "@angular/router";
import {MatButtonModule} from "@angular/material/button";
import {KubernetesNetworkServiceDetailComponent} from "./detail/kubernetes.network.service.detail.component";
import {LoaderModule} from "../../../../components/loader/loader.module";
import {MatExpansionModule} from "@angular/material/expansion";
import {FormContainerModule} from "../../../../components/form/container/form.container.module";
import {
  FormMultipleContainerModule
} from "../../../../components/form/multiple-container/form.multiple-container.module";
import {MatChipsModule} from "@angular/material/chips";
import {
  KubernetesNetworkServiceDetailConnectionComponent
} from "./detail/connection/kubernetes.network.service.detail.connection.component";
import {KubernetesComponentsActionsModule} from "../../components/action/kubernetes.components.actions.module";

@NgModule({
  declarations: [
    KubernetesNetworkServiceListComponent,
    KubernetesNetworkServiceDetailComponent,
    KubernetesNetworkServiceDetailConnectionComponent,
  ],
  exports: [
    KubernetesNetworkServiceListComponent,
    KubernetesNetworkServiceDetailComponent,
    KubernetesNetworkServiceDetailConnectionComponent,
  ],
    imports: [
        CommonModule,
        KubernetesComponentsListModule,
        MatMenuModule,
        MatIconModule,
        RouterLink,
        MatButtonModule,
        LoaderModule,
        MatExpansionModule,
        FormContainerModule,
        FormMultipleContainerModule,
        MatChipsModule,
        KubernetesComponentsActionsModule,
    ],
  providers: [
    KubernetesNetworkServiceService
  ]
})
export class KubernetesNetworkServiceModule {
}
