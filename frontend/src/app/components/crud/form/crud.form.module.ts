import {NgModule} from "@angular/core";
import {LoaderModule} from "../../loader/loader.module";
import {CommonModule} from "@angular/common";
import {FormContainerModule} from "../../form/container/form.container.module";
import {FormMultipleContainerModule} from "../../form/multiple-container/form.multiple-container.module";
import {ReactiveFormsModule} from "@angular/forms";
import {MatButtonModule} from "@angular/material/button";
import {RouterModule} from "@angular/router";
import {CrudFormComponent} from "./crud.form.component";

@NgModule({
  declarations: [
    CrudFormComponent
  ],
  exports: [
    CrudFormComponent
  ],
  imports: [
    CommonModule,
    FormContainerModule,
    FormMultipleContainerModule,
    LoaderModule,
    ReactiveFormsModule,
    MatButtonModule,
    RouterModule
  ]
})
export class CrudFormModule {

}
