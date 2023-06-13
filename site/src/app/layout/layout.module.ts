import { NgModule } from '@angular/core';
import { LayoutComponent } from 'app/layout/layout.component';
import { EmptyLayoutModule } from 'app/layout/layouts/empty/empty.module';
import { DefaultLayoutModule } from './layouts/default-layout/default-layout.module';
import { CommonModule } from '@angular/common';

const layoutModules = [
    // Empty
    EmptyLayoutModule,
    DefaultLayoutModule
];

@NgModule({
    declarations: [
        LayoutComponent
    ],
    imports: [
        CommonModule,
        ...layoutModules
    ],
    exports: [
        LayoutComponent,
        ...layoutModules
    ]
})
export class LayoutModule {
}
