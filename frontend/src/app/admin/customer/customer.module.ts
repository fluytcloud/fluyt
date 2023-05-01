import {NgModule} from "@angular/core";
import {CommonModule} from "@angular/common";
import {CustomerFormComponent} from "./form/customer.form.component";
import {CustomerListComponent} from "./list/customer.list.component";
import {CustomerService} from "./customer.service";
import {TableModule} from "primeng/table";
import {MatIconModule} from "@angular/material/icon";
import {RouterModule} from "@angular/router";
import {LoaderModule} from "../../components/loader/loader.module";
import {ReactiveFormsModule} from "@angular/forms";
import {InputTextModule} from "primeng/inputtext";
import {InputMaskModule} from "primeng/inputmask";
import {CheckboxModule} from "primeng/checkbox";
import {FormContainerModule} from "../../components/form/container/form.container.module";
import {FormMultipleContainerModule} from "../../components/form/multiple-container/form.multiple-container.module";
import {PipesBooleanModule} from "../../pipes/boolean/pipes.boolean.module";
import {MatMenuModule} from "@angular/material/menu";
import {MatButtonModule} from "@angular/material/button";
import {MatCardModule} from "@angular/material/card";
import {CrudListModule} from "../../components/crud/list/crud.list.module";

@NgModule({
  declarations: [
    CustomerFormComponent,
    CustomerListComponent
  ],
    imports: [
        CommonModule,
        RouterModule,
        MatMenuModule,
        MatIconModule,
        MatButtonModule,
        LoaderModule,
        ReactiveFormsModule,
        InputTextModule,
        InputMaskModule,
        CheckboxModule,
        FormContainerModule,
        FormMultipleContainerModule,
        PipesBooleanModule,
        MatCardModule,
        CrudListModule
    ],
  providers: [
    CustomerService
  ]
})
export class CustomerModule {

}
