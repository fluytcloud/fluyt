import {NgModule} from "@angular/core";
import {CommonModule} from "@angular/common";
import {MatButtonModule} from "@angular/material/button";
import {TableModule} from "primeng/table";
import {MatMenuModule} from "@angular/material/menu";
import {MatIconModule} from "@angular/material/icon";
import {FormsModule, ReactiveFormsModule} from "@angular/forms";
import {InputTextModule} from "primeng/inputtext";
import {CheckboxModule} from "primeng/checkbox";
import {MatCardModule} from "@angular/material/card";
import {FormContainerModule} from "../../../components/form/container/form.container.module";
import {LoaderModule} from "../../../components/loader/loader.module";
import {CrudListModule} from "../../../components/crud/list/crud.list.module";
import {TemplateListComponent} from "./list/template.list.component";
import {RouterModule} from "@angular/router";
import {TemplateService} from "./template.service";
import {ScmService} from "../../settings/scm/scm.service";
import {TemplateFormComponent} from "./form/template.form.component";
import {AutoCompleteModule} from "primeng/autocomplete";
import {TemplateCatalogComponent} from "./catalog/template.catalog.component";
import {PaginatorModule} from "primeng/paginator";
import {TemplateGeneratorComponent} from "./generator/template.generator.component";
import {InputNumberModule} from "primeng/inputnumber";
import {DropdownModule} from "primeng/dropdown";
import {SseService} from "../../../support/sse.service";
import {DialogModule} from "primeng/dialog";
import {TimelineModule} from "primeng/timeline";

@NgModule({
  declarations: [
    TemplateListComponent,
    TemplateFormComponent,
    TemplateCatalogComponent,
    TemplateGeneratorComponent
  ],
  exports: [
    TemplateListComponent,
    TemplateFormComponent,
    TemplateCatalogComponent,
    TemplateGeneratorComponent
  ],
  imports: [
    CommonModule,
    MatButtonModule,
    TableModule,
    MatMenuModule,
    MatIconModule,
    FormContainerModule,
    LoaderModule,
    FormsModule,
    ReactiveFormsModule,
    InputTextModule,
    CheckboxModule,
    CrudListModule,
    MatCardModule,
    RouterModule,
    AutoCompleteModule,
    PaginatorModule,
    InputNumberModule,
    DropdownModule,
    DialogModule,
    TimelineModule
  ],
  providers: [
    TemplateService,
    ScmService,
    SseService
  ]
})
export class TemplateModule {

}
