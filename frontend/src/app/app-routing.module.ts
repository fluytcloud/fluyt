import {NgModule} from '@angular/core';
import {RouterModule, Routes} from '@angular/router';
import {AuthGuard} from "./auth/guard/auth.guard";
import {ForbiddenComponent} from "./components/forbidden/forbidden.component";

const routes: Routes = [
    {
      path: 'admin',
      canActivate: [AuthGuard],
      loadChildren: () => import('./admin/admin.module').then(m => m.AdminModule),
      data: {
        roles: ['administrator']
      }
    },
    {
      path: 'forbidden',
      canActivate: [AuthGuard],
      component: ForbiddenComponent
    },
    {
      path: '',
      canActivate: [AuthGuard],
      loadChildren: () => import('./system/system.module').then(m => m.SystemModule),
      data: {
        roles: ['user', 'manager']
      }
    }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
