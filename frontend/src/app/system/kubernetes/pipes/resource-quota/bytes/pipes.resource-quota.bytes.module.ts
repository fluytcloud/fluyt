import {NgModule} from "@angular/core";
import {CommonModule} from "@angular/common";
import {PipesResourceQuotaBytesComponent} from "./pipes.resource-quota.bytes.component";

@NgModule({
  declarations: [
    PipesResourceQuotaBytesComponent
  ],
  exports: [
    PipesResourceQuotaBytesComponent
  ],
  imports: [
    CommonModule
  ]
})
export class PipesResourceQuotaBytesModule {

}
