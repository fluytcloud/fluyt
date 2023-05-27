import {NgModule} from "@angular/core";
import {CommonModule} from "@angular/common";
import {PipesBytesComponent} from "./pipes.bytes.component";

@NgModule({
  declarations: [
    PipesBytesComponent
  ],
  exports: [
    PipesBytesComponent
  ],
  imports: [
    CommonModule
  ]
})
export class PipesBytesModule {

}
