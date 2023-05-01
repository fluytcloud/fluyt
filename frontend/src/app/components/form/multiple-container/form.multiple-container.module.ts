import {NgModule} from "@angular/core";
import {CommonModule} from "@angular/common";
import {FormMultipleContainerComponent} from "./form.multiple-container.component";

@NgModule({
  declarations: [
    FormMultipleContainerComponent
  ],
  exports: [
    FormMultipleContainerComponent
  ],
  imports: [
    CommonModule
  ]
})
export class FormMultipleContainerModule {

}
