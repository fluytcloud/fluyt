import {NgModule} from "@angular/core";
import {CommonModule} from "@angular/common";
import {PipesDeploymentConditionComponent} from "./pipes.deployment.condition.component";

@NgModule({
  declarations: [
    PipesDeploymentConditionComponent
  ],
  exports: [
    PipesDeploymentConditionComponent
  ],
  imports: [
    CommonModule
  ]
})
export class PipesDeploymentConditionModule {

}
