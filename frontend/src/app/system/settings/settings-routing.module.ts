import {NgModule} from '@angular/core';
import {RouterModule, Routes} from '@angular/router';
import {AuthGuard} from "../../auth/guard/auth.guard";
import {CompanyListComponent} from "./company/list/company.list.component";
import {CompanyFormComponent} from "./company/form/company.form.component";

const routes: Routes = [
  {
    path: '',
    canActivate: [AuthGuard],
    children: [
      {
        path: 'company',
        component: CompanyListComponent
      },
      {
        path: 'company/form',
        component: CompanyFormComponent
      },
      {
        path: 'company/form/:id',
        component: CompanyFormComponent
      },
      {
        path: 'scm',
        loadChildren: () => import('./scm/scm.module').then(m => m.ScmModule),
      }
    ],
    data: {
      roles: ['manager']
    }
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class SettingsRoutingModule {
}
