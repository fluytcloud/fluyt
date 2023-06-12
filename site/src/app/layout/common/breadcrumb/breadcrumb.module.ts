import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { BreadcrumbComponent } from './breadcrumb.component';
import { MatIconModule } from '@angular/material/icon';

// TODO: lidar com rotas que não rederizam sozinhas

@NgModule({
  declarations: [
    BreadcrumbComponent
  ],
  exports: [
    BreadcrumbComponent,
  ],
  imports: [
    CommonModule,
    MatIconModule,
  ]
})
export class BreadcrumbModule { }
