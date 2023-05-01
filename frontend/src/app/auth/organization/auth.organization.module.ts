import {NgModule} from "@angular/core";
import {CommonModule} from "@angular/common";
import {LoaderModule} from "../../components/loader/loader.module";
import {ButtonModule} from "primeng/button";
import {AuthOrganizationComponent} from "./auth.organization.component";

@NgModule({
  declarations: [
    AuthOrganizationComponent
  ],
  exports: [
    AuthOrganizationComponent
  ],
  imports: [
    CommonModule,
    LoaderModule,
    ButtonModule
  ]
})
export class AuthOrganizationModule {

}
