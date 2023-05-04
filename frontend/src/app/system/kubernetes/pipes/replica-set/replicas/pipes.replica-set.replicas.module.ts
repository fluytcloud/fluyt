import {NgModule} from "@angular/core";
import {CommonModule} from "@angular/common";
import {PipesReplicaSetReplicasComponent} from "./pipes.replica-set.replicas.component";

@NgModule({
  declarations: [
    PipesReplicaSetReplicasComponent
  ],
  exports: [
    PipesReplicaSetReplicasComponent
  ],
  imports: [
    CommonModule
  ]
})
export class PipesReplicaSetReplicasModule {

}
