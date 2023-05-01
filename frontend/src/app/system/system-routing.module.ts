import {NgModule} from '@angular/core';
import {RouterModule, Routes} from '@angular/router';
import {HomeComponent} from "./home/home.component";
import {AuthGuard} from "../auth/guard/auth.guard";

const routes: Routes = [
  {
    path: 'settings',
    canActivate: [AuthGuard],
    loadChildren: () => import('./settings/settings.module').then(m => m.SettingsModule),
    data: {
      roles: ['manager']
    }
  },
  {
    path: 'kubernetes',
    canActivate: [AuthGuard],
    loadChildren: () => import('./kubernetes/kubernetes.module').then(m => m.KubernetesModule),
    data: {
      roles: ['user', 'manager']
    }
  },
  {
    path: 'home',
    canActivate: [AuthGuard],
    component: HomeComponent,
    data: {
      roles: ['user', 'manager']
    }
  },
  {
    path: '**',
    canActivate: [AuthGuard],
    component: HomeComponent,
    data: {
      roles: ['user', 'manager']
    }
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class SystemRoutingModule { }
