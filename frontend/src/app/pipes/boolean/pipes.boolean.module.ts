import {NgModule} from "@angular/core";
import {PipesBooleanComponent} from "./pipes.boolean.component";
import {CommonModule} from "@angular/common";

@NgModule({
  declarations: [
    PipesBooleanComponent
  ],
  exports: [
    PipesBooleanComponent
  ],
  imports: [
    CommonModule
  ]
})
export class PipesBooleanModule {

}
