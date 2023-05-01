import {NgModule} from "@angular/core";
import {KubernetesClusterListComponent} from "./list/kubernetes.cluster.list.component";
import {KubernetesClusterFormComponent} from "./form/kubernetes.cluster.form.component";
import {KubernetesClusterService} from "./kubernetes.cluster.service";
import {CommonModule} from "@angular/common";
import {KubernetesRoutingModule} from "../kubernetes-routing.module";
import {MatButtonModule} from "@angular/material/button";
import {TableModule} from "primeng/table";
import {MatMenuModule} from "@angular/material/menu";
import {MatIconModule} from "@angular/material/icon";
import {FormContainerModule} from "../../../components/form/container/form.container.module";
import {DropdownModule} from "primeng/dropdown";
import {LoaderModule} from "../../../components/loader/loader.module";
import {FormsModule, ReactiveFormsModule} from "@angular/forms";
import {PasswordModule} from "primeng/password";
import {InputTextModule} from "primeng/inputtext";
import {CheckboxModule} from "primeng/checkbox";
import {CrudListModule} from "../../../components/crud/list/crud.list.module";
import {MatCardModule} from "@angular/material/card";

@NgModule({
  declarations: [
    KubernetesClusterListComponent,
    KubernetesClusterFormComponent
  ],
  exports: [
    KubernetesClusterListComponent,
    KubernetesClusterFormComponent
  ],
  imports: [
    CommonModule,
    KubernetesRoutingModule,
    MatButtonModule,
    TableModule,
    MatMenuModule,
    MatIconModule,
    FormContainerModule,
    DropdownModule,
    LoaderModule,
    FormsModule,
    ReactiveFormsModule,
    PasswordModule,
    InputTextModule,
    CheckboxModule,
    CrudListModule,
    MatCardModule
  ],
  providers: [
    KubernetesClusterService
  ]
})
export class KubernetesClusterModule {

}
