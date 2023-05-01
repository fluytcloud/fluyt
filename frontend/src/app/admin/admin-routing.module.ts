import {NgModule} from '@angular/core';
import {RouterModule, Routes} from '@angular/router';
import {AuthGuard} from "../auth/guard/auth.guard";
import {HomeComponent} from "./home/home.component";
import {CustomerListComponent} from "./customer/list/customer.list.component";
import {CustomerFormComponent} from "./customer/form/customer.form.component";

const routes: Routes = [
  {
    path: '',
    canActivate: [AuthGuard],
    data: {
      roles: ['administrator']
    },
    children: [
      {
        path: 'home',
        component: HomeComponent
      },
      {
        path: 'customer',
        component: CustomerListComponent
      },
      {
        path: 'customer/form',
        component: CustomerFormComponent
      },
      {
        path: 'customer/form/:id',
        component: CustomerFormComponent
      },
      {
        path: '**',
        component: HomeComponent
      }
    ]
  },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class AdminRoutingModule { }
