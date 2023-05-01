import {NgModule} from "@angular/core";
import {CommonModule} from "@angular/common";
import {PipesPodContainerMountComponent} from "./pipes.pod.container.mount.component";

@NgModule({
  declarations: [
    PipesPodContainerMountComponent
  ],
  exports: [
    PipesPodContainerMountComponent
  ],
  imports: [
    CommonModule
  ]
})
export class PipesPodContainerMountModule {

}
