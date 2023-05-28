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
import {TableModule} from "primeng/table";
import {MatDividerModule} from "@angular/material/divider";
import {KubernetesEventModule} from "../../events/kubernetes.event.module";
import {KubernetesConfigLimitRangeService} from "./kubernetes.config.limit-range.service";
import {KubernetesConfigLimitRangeListComponent} from "./list/kubernetes.config.limit-range.list.component";
import {KubernetesConfigLimitRangeDetailComponent} from "./detail/kubernetes.config.limit-range.detail.component";
import {
  KubernetesConfigLimitRangeDetailtLimitComponent
} from "./detail/limit/kubernetes.config.limit-range.detailt.limit.component";
import {PipesBytesModule} from "../../../../pipes/bytes/pipes.bytes.module";
import {KubernetesComponentsActionsModule} from "../../components/action/kubernetes.components.actions.module";

@NgModule({
  declarations: [
    KubernetesConfigLimitRangeListComponent,
    KubernetesConfigLimitRangeDetailComponent,
    KubernetesConfigLimitRangeDetailtLimitComponent
  ],
  exports: [
    KubernetesConfigLimitRangeListComponent,
    KubernetesConfigLimitRangeDetailComponent,
    KubernetesConfigLimitRangeDetailtLimitComponent
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
        PipesBytesModule,
        KubernetesEventModule,
        KubernetesComponentsActionsModule
    ],
  providers: [
    KubernetesConfigLimitRangeService
  ]
})
export class KubernetesConfigLimitRangeModule {

}
