import {NgModule} from "@angular/core";
import {KubernetesCatalogComponent} from "./kubernetes.catalog.component";
import {CommonModule} from "@angular/common";
import {RouterModule} from "@angular/router";
import {KubernetesCatalogService} from "./kubernetes.catalog.service";
import {LoaderModule} from "../../../components/loader/loader.module";
import {PaginatorModule} from "primeng/paginator";
import {CardModule} from "primeng/card";
import {MatCardModule} from "@angular/material/card";
import {RippleModule} from "primeng/ripple";

@NgModule({
  declarations: [
    KubernetesCatalogComponent
  ],
  exports: [
    KubernetesCatalogComponent
  ],
    imports: [
        CommonModule,
        RouterModule,
        LoaderModule,
        PaginatorModule,
        CardModule,
        MatCardModule,
        RippleModule
    ],
  providers: [
    KubernetesCatalogService
  ]
})
export class KubernetesCatalogModule {

}
