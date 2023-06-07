import {NgModule} from '@angular/core';
import {RouterModule, Routes} from '@angular/router';
import {TemplateListComponent} from "./template/list/template.list.component";
import {AuthGuard} from "../../auth/guard/auth.guard";
import {TemplateFormComponent} from "./template/form/template.form.component";
import {TemplateCatalogComponent} from "./template/catalog/template.catalog.component";
import {TemplateGeneratorComponent} from "./template/generator/template.generator.component";

const routes: Routes = [
  {
    path: 'template',
    canActivate: [AuthGuard],
    component: TemplateListComponent,
    data: {
      roles: ['manager']
    }
  },
  {
    path: 'template/form',
    canActivate: [AuthGuard],
    component: TemplateFormComponent,
    data: {
      roles: ['manager']
    }
  },
  {
    path: 'template/form/:id',
    canActivate: [AuthGuard],
    component: TemplateFormComponent,
    data: {
      roles: ['manager']
    }
  },
  {
    path: 'generate',
    canActivate: [AuthGuard],
    component: TemplateCatalogComponent,
    data: {
      roles: ['user']
    }
  },
  {
    path: 'generate/:id',
    canActivate: [AuthGuard],
    component: TemplateGeneratorComponent,
    data: {
      roles: ['user']
    }
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class CatalogRoutingModule {
}
