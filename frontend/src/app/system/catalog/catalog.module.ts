import {NgModule} from "@angular/core";
import {CommonModule} from "@angular/common";
import {CatalogRoutingModule} from "./catalog-routing.module";
import {TemplateModule} from "./template/template.module";

@NgModule({
  declarations: [],
  exports: [],
  imports: [
    CommonModule,
    CatalogRoutingModule,
    TemplateModule
  ],
  providers: []
})
export class CatalogModule {

}
