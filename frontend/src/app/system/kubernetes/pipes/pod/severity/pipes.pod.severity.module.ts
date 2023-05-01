import {NgModule} from "@angular/core";
import {CommonModule} from "@angular/common";
import {PipesPodSeverityComponent} from "./pipes.pod.severity.component";

@NgModule({
  declarations: [
    PipesPodSeverityComponent
  ],
  exports: [
    PipesPodSeverityComponent
  ],
  imports: [
    CommonModule
  ]
})
export class PipesPodSeverityModule {

}
