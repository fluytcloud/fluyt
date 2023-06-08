import {NgModule} from "@angular/core";
import {CommonModule} from "@angular/common";
import {MatCardModule} from "@angular/material/card";
import {TableModule} from "primeng/table";
import {MatMenuModule} from "@angular/material/menu";
import {MatIconModule} from "@angular/material/icon";
import {MatButtonModule} from "@angular/material/button";
import {RouterModule} from "@angular/router";
import {LoaderModule} from "../../../../components/loader/loader.module";
import {MatExpansionModule} from "@angular/material/expansion";
import {FormContainerModule} from "../../../../components/form/container/form.container.module";
import {
  FormMultipleContainerModule
} from "../../../../components/form/multiple-container/form.multiple-container.module";
import {FormsModule} from "@angular/forms";
import {KubernetesComponentsListModule} from "../../components/list/kubernetes.components.list.module";
import {KubernetesConfigResourceQuotaListComponent} from "./list/kubernetes.config.resource-quota.list.component";
import {KubernetesConfigResourceQuotaService} from "./kubernetes.config.resource-quota.service";
import {KubernetesConfigResourceQuotaDetailComponent} from "./detail/kubernetes.config.resource-quota.detail.component";
import {MatProgressBarModule} from "@angular/material/progress-bar";
import {
  KubernetesConfigResourceQuotaDetailQuotaComponents
} from "./detail/quota/kubernetes.config.resource-quota.detail.quota.components";
import {PipesBytesModule} from "../../../../pipes/bytes/pipes.bytes.module";
import {MatChipsModule} from "@angular/material/chips";
import {KubernetesComponentsActionsModule} from "../../components/action/kubernetes.components.actions.module";

@NgModule({
  declarations: [
    KubernetesConfigResourceQuotaListComponent,
    KubernetesConfigResourceQuotaDetailComponent,
    KubernetesConfigResourceQuotaDetailQuotaComponents
  ],
  exports: [
    KubernetesConfigResourceQuotaListComponent,
    KubernetesConfigResourceQuotaDetailComponent,
    KubernetesConfigResourceQuotaDetailQuotaComponents
  ],
    imports: [
        CommonModule,
        MatCardModule,
        TableModule,
        FormsModule,
        MatMenuModule,
        MatIconModule,
        MatButtonModule,
        RouterModule,
        LoaderModule,
        MatExpansionModule,
        FormContainerModule,
        FormMultipleContainerModule,
        KubernetesComponentsListModule,
        MatProgressBarModule,
        MatChipsModule,
        PipesBytesModule,
        KubernetesComponentsActionsModule
    ],
  providers: [
    KubernetesConfigResourceQuotaService
  ]
})
export class KubernetesConfigResourceQuotaModule {

}
