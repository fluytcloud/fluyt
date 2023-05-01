import {NgModule} from "@angular/core";
import {CrudListComponent} from "./crud.list.component";
import {CommonModule} from "@angular/common";
import {TableModule} from "primeng/table";
import {FormContainerModule} from "../../form/container/form.container.module";
import {FormMultipleContainerModule} from "../../form/multiple-container/form.multiple-container.module";
import {LoaderModule} from "../../loader/loader.module";
import {ReactiveFormsModule} from "@angular/forms";
import {MatButtonModule} from "@angular/material/button";
import {RouterModule} from "@angular/router";
import {InputTextModule} from "primeng/inputtext";
import {MatIconModule} from "@angular/material/icon";
import {CheckboxModule} from "primeng/checkbox";
import {PipesBooleanModule} from "../../../pipes/boolean/pipes.boolean.module";
import {CrudFormModule} from "../form/crud.form.module";
import {MatMenuModule} from "@angular/material/menu";
import {MatCardModule} from "@angular/material/card";

@NgModule({
  declarations: [
    CrudListComponent
  ],
  exports: [
    CrudListComponent
  ],
  imports: [
    CommonModule,
    TableModule,
    FormContainerModule,
    FormMultipleContainerModule,
    LoaderModule,
    ReactiveFormsModule,
    MatButtonModule,
    RouterModule,
    InputTextModule,
    MatMenuModule,
    MatIconModule,
    CheckboxModule,
    PipesBooleanModule,
    CrudFormModule,
    MatCardModule
  ]
})
export class CrudListModule {

}
