import {NgModule} from "@angular/core";
import {KubernetesConfigConfigMapService} from "./kubernetes.config.config-map.service";
import {KubernetesConfigConfigMapListComponent} from "./list/kubernetes.config.config-map.list.component";
import {CommonModule} from "@angular/common";
import {MatCardModule} from "@angular/material/card";
import {TableModule} from "primeng/table";
import {MatMenuModule} from "@angular/material/menu";
import {MatIconModule} from "@angular/material/icon";
import {MatButtonModule} from "@angular/material/button";
import {RouterModule} from "@angular/router";
import {KubernetesConfigConfigMapDetailComponent} from "./detail/kubernetes.config.config-map.detail.component";
import {LoaderModule} from "../../../../components/loader/loader.module";
import {MatExpansionModule} from "@angular/material/expansion";
import {FormContainerModule} from "../../../../components/form/container/form.container.module";
import {
  FormMultipleContainerModule
} from "../../../../components/form/multiple-container/form.multiple-container.module";
import {CodemirrorModule} from "@ctrl/ngx-codemirror";
import {FormsModule} from "@angular/forms";
import {KubernetesComponentsListModule} from "../../components/list/kubernetes.components.list.module";
import {MatChipsModule} from "@angular/material/chips";
import {KubernetesComponentsActionsModule} from "../../components/action/kubernetes.components.actions.module";

@NgModule({
  declarations: [
    KubernetesConfigConfigMapListComponent,
    KubernetesConfigConfigMapDetailComponent
  ],
  exports: [
    KubernetesConfigConfigMapListComponent,
    KubernetesConfigConfigMapDetailComponent
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
        CodemirrorModule,
        MatChipsModule,
        KubernetesComponentsListModule,
        KubernetesComponentsActionsModule
    ],
  providers: [
    KubernetesConfigConfigMapService
  ]
})
export class KubernetesConfigConfigMapModule {

}
