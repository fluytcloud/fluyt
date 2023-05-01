import {NgModule} from "@angular/core";
import {CommonModule} from "@angular/common";
import {AdminRoutingModule} from "./admin-routing.module";
import {HomeModule} from "./home/home.module";
import {CustomerModule} from "./customer/customer.module";

@NgModule({
  imports: [
    CommonModule,
    AdminRoutingModule,
    HomeModule,
    CustomerModule
  ]
})
export class AdminModule {

}
