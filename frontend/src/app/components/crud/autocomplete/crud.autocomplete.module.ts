import {NgModule} from "@angular/core";
import {CrudAutocompleteComponent} from "./crud.autocomplete.component";
import {FormsModule, ReactiveFormsModule} from "@angular/forms";
import {CommonModule} from "@angular/common";
import {AutoCompleteModule} from "primeng/autocomplete";
import {FormContainerModule} from "../../form/container/form.container.module";

@NgModule({
  declarations: [
    CrudAutocompleteComponent
  ],
  exports: [
    CrudAutocompleteComponent
  ],
  imports: [
    CommonModule,
    ReactiveFormsModule,
    FormsModule,
    AutoCompleteModule,
    FormContainerModule
  ]
})
export class CrudAutocompleteModule {

}
