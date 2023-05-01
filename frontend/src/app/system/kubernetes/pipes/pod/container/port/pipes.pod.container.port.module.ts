import {NgModule} from "@angular/core";
import {CommonModule} from "@angular/common";
import {PipesPodContainerPortComponent} from "./pipes.pod.container.port.component";

@NgModule({
  declarations: [
    PipesPodContainerPortComponent
  ],
  exports: [
    PipesPodContainerPortComponent
  ],
  imports: [
    CommonModule
  ]
})
export class PipesPodContainerPortModule {

}
