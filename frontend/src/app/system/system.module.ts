import {NgModule} from "@angular/core";
import {CommonModule} from "@angular/common";
import {HomeModule} from "./home/home.module";
import {SystemRoutingModule} from "./system-routing.module";

@NgModule({
  imports: [
    CommonModule,
    HomeModule,
    SystemRoutingModule
  ]
})
export class SystemModule {

}
