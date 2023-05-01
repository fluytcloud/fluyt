import {NgModule} from "@angular/core";
import {CommonModule} from "@angular/common";
import {LoaderModule} from "../../components/loader/loader.module";
import {ButtonModule} from "primeng/button";
import {AuthCompanyComponent} from "./auth.company.component";

@NgModule({
  declarations: [
    AuthCompanyComponent
  ],
  exports: [
    AuthCompanyComponent
  ],
  imports: [
    CommonModule,
    LoaderModule,
    ButtonModule
  ]
})
export class AuthCompanyModule {

}
