import {NgModule} from "@angular/core";
import {CommonModule} from "@angular/common";
import {SettingsRoutingModule} from "./settings-routing.module";
import {CompanyModule} from "./company/company.module";

@NgModule({
  imports: [
    CommonModule,
    SettingsRoutingModule,
    CompanyModule
  ]
})
export class SettingsModule {

}
