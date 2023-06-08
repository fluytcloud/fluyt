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
import {CodemirrorModule} from "@ctrl/ngx-codemirror";
import {FormsModule} from "@angular/forms";
import {KubernetesComponentsListModule} from "../../components/list/kubernetes.components.list.module";
import {KubernetesConfigSecretService} from "./kubernetes.config.secret.service";
import {KubernetesConfigSecretListComponent} from "./list/kubernetes.config.secret.list.component";
import {KubernetesConfigSecretDetailComponent} from "./detail/kubernetes.config.secret.detail.component";
import {MatChipsModule} from "@angular/material/chips";
import {KubernetesComponentsActionsModule} from "../../components/action/kubernetes.components.actions.module";

@NgModule({
  declarations: [
    KubernetesConfigSecretListComponent,
    KubernetesConfigSecretDetailComponent
  ],
  exports: [
    KubernetesConfigSecretListComponent,
    KubernetesConfigSecretDetailComponent
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
    KubernetesConfigSecretService
  ]
})
export class KubernetesConfigSecretModule {

}
