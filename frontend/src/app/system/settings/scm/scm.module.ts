import {NgModule} from "@angular/core";
import {CommonModule} from "@angular/common";
import {MatButtonModule} from "@angular/material/button";
import {TableModule} from "primeng/table";
import {MatMenuModule} from "@angular/material/menu";
import {MatIconModule} from "@angular/material/icon";
import {DropdownModule} from "primeng/dropdown";
import {FormsModule, ReactiveFormsModule} from "@angular/forms";
import {PasswordModule} from "primeng/password";
import {InputTextModule} from "primeng/inputtext";
import {CheckboxModule} from "primeng/checkbox";
import {MatCardModule} from "@angular/material/card";
import {ScmService} from "./scm.service";
import {ScmRoutingModule} from "./scm-routing.module";
import {FormContainerModule} from "../../../components/form/container/form.container.module";
import {LoaderModule} from "../../../components/loader/loader.module";
import {CrudListModule} from "../../../components/crud/list/crud.list.module";
import {ScmFormComponent} from "./form/scm.form.component";
import {ScmListComponent} from "./list/scm.list.component";

@NgModule({
  declarations: [
    ScmListComponent,
    ScmFormComponent
  ],
  exports: [
    ScmListComponent,
    ScmFormComponent
  ],
  imports: [
    CommonModule,
    ScmRoutingModule,
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
    ScmService
  ]
})
export class ScmModule {

}
