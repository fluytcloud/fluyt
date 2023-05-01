import {NgModule} from "@angular/core";
import {ForbiddenComponent} from "./forbidden.component";
import {CommonModule} from "@angular/common";

@NgModule({
  declarations: [
    ForbiddenComponent
  ],
  exports: [
    ForbiddenComponent
  ],
  imports: [
    CommonModule
  ]
})
export class ForbiddenModule {

}
