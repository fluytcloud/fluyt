import {NgModule} from '@angular/core';
import {RouterModule, Routes} from '@angular/router';
import {AuthGuard} from "../../../auth/guard/auth.guard";
import {ScmFormComponent} from "./form/scm.form.component";
import {ScmListComponent} from "./list/scm.list.component";


const routes: Routes = [
  {
    path: '',
    canActivate: [AuthGuard],
    component: ScmListComponent,
    data: {
      roles: ['manager']
    }
  },
  {
    path: 'form',
    canActivate: [AuthGuard],
    component: ScmFormComponent,
    data: {
      roles: ['manager']
    }
  },
  {
    path: 'form/:id',
    canActivate: [AuthGuard],
    component: ScmFormComponent,
    data: {
      roles: ['manager']
    }
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class ScmRoutingModule {
}
