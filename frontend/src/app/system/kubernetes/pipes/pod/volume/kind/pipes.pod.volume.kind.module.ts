import {NgModule} from "@angular/core";
import {CommonModule} from "@angular/common";
import {PipesPodVolumeKindComponent} from "./pipes.pod.volume.kind.component";

@NgModule({
  declarations: [
    PipesPodVolumeKindComponent
  ],
  exports: [
    PipesPodVolumeKindComponent
  ],
  imports: [
    CommonModule
  ]
})
export class PipesPodVolumeKindModule {

}
