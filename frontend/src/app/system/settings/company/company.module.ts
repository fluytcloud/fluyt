import {NgModule} from "@angular/core";
import {CommonModule} from "@angular/common";
import {CompanyListComponent} from "./list/company.list.component";
import {CompanyFormComponent} from "./form/company.form.component";
import {CompanyService} from "./company.service";
import {FormContainerModule} from "../../../components/form/container/form.container.module";
import {InputMaskModule} from "primeng/inputmask";
import {FormMultipleContainerModule} from "../../../components/form/multiple-container/form.multiple-container.module";
import {LoaderModule} from "../../../components/loader/loader.module";
import {ReactiveFormsModule} from "@angular/forms";
import {RouterModule} from "@angular/router";
import {InputTextModule} from "primeng/inputtext";
import {MatMenuModule} from "@angular/material/menu";
import {MatIconModule} from "@angular/material/icon";
import {AutoCompleteModule} from "primeng/autocomplete";
import {MatButtonModule} from "@angular/material/button";
import {MatCardModule} from "@angular/material/card";
import {CrudListModule} from "../../../components/crud/list/crud.list.module";

@NgModule({
  declarations: [
    CompanyListComponent,
    CompanyFormComponent,
  ],
  exports: [
    CompanyListComponent,
    CompanyFormComponent
  ],
    imports: [
        CommonModule,
        FormContainerModule,
        InputMaskModule,
        FormMultipleContainerModule,
        LoaderModule,
        ReactiveFormsModule,
        MatButtonModule,
        RouterModule,
        InputTextModule,
        MatMenuModule,
        MatIconModule,
        AutoCompleteModule,
        MatCardModule,
        CrudListModule
    ],
  providers: [
    CompanyService
  ]
})
export class CompanyModule {

}
