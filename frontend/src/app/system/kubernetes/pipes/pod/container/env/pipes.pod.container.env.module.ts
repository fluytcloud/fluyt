import {NgModule} from "@angular/core";
import {CommonModule} from "@angular/common";
import {PipesPodContainerEnvComponent} from "./pipes.pod.container.env.component";

@NgModule({
  declarations: [
    PipesPodContainerEnvComponent
  ],
  exports: [
    PipesPodContainerEnvComponent
  ],
  imports: [
    CommonModule
  ]
})
export class PipesPodContainerEnvModule {

}
