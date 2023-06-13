import { CommonModule } from '@angular/common';
import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { EmptyLayoutComponent } from 'app/layout/layouts/empty/empty.component';

@NgModule({
    declarations: [
        EmptyLayoutComponent,
    ],
    imports: [
        RouterModule,
        CommonModule
    ],
    exports: [
        EmptyLayoutComponent
    ]
})
export class EmptyLayoutModule {
}
