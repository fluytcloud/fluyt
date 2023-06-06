import {NgModule} from "@angular/core";
import {CommonModule} from "@angular/common";
import {KubernetesEventService} from "./kubernetes.event.service";
import {KubernetesEventSimpleListComponent} from "./simple/kubernetes.event.simple.list.component";
import {MatExpansionModule} from "@angular/material/expansion";
import {FormContainerModule} from "../../../components/form/container/form.container.module";
import {KubernetesEventListComponent} from "./list/kubernetes.event.list.component";
import {KubernetesComponentsActionsModule} from "../components/action/kubernetes.components.actions.module";
import {KubernetesComponentsListModule} from "../components/list/kubernetes.components.list.module";
import {PipesDeploymentConditionModule} from "../pipes/deployment/condition/pipes.deployment.condition.module";
import {TagModule} from "primeng/tag";
import {KubernetesEventDetailComponent} from "./detail/kubernetes.event.detail.component";
import {LoaderModule} from "../../../components/loader/loader.module";
import {MatButtonModule} from "@angular/material/button";
import {FormMultipleContainerModule} from "../../../components/form/multiple-container/form.multiple-container.module";
import {KubernetesComponentsSimpleListModule} from "../components/list/simple/kubernetes.components.simple.list.module";
import {TableModule} from "primeng/table";
import {RouterLink} from "@angular/router";

@NgModule({
  declarations: [
    KubernetesEventListComponent,
    KubernetesEventDetailComponent,
    KubernetesEventSimpleListComponent
  ],
  exports: [
    KubernetesEventListComponent,
    KubernetesEventDetailComponent,
    KubernetesEventSimpleListComponent
  ],
    imports: [
        CommonModule,
        MatExpansionModule,
        FormContainerModule,
        KubernetesComponentsActionsModule,
        KubernetesComponentsListModule,
        PipesDeploymentConditionModule,
        TagModule,
        LoaderModule,
        MatButtonModule,
        FormMultipleContainerModule,
        KubernetesComponentsSimpleListModule,
        TableModule,
        RouterLink
    ],
  providers: [
    KubernetesEventService
  ]
})
export class KubernetesEventModule {

}
