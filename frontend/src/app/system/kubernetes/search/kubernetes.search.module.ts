import {NgModule} from "@angular/core";
import {KubernetesSearchComponent} from "./kubernetes.search.component";
import {CommonModule} from "@angular/common";
import {FormsModule} from "@angular/forms";
import {MultiSelectModule} from "primeng/multiselect";
import {InputTextModule} from "primeng/inputtext";
import {KubernetesSearchService} from "./kubernetes.search.service";
import {FormMultipleContainerModule} from "../../../components/form/multiple-container/form.multiple-container.module";
import {FormContainerModule} from "../../../components/form/container/form.container.module";

@NgModule({
  declarations: [
    KubernetesSearchComponent
  ],
  exports: [
    KubernetesSearchComponent
  ],
  imports: [
    CommonModule,
    FormsModule,
    MultiSelectModule,
    InputTextModule,
    FormMultipleContainerModule,
    FormContainerModule
  ],
  providers: [
    KubernetesSearchService
  ]
})
export class KubernetesSearchModule {

}
