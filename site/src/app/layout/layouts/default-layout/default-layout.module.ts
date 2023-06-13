import { HttpClientModule } from '@angular/common/http';
import { NgModule } from '@angular/core';
import { MatLegacyButtonModule as MatButtonModule } from '@angular/material/legacy-button';
import { MatDividerModule } from '@angular/material/divider';
import { MatIconModule } from '@angular/material/icon';
import { MatLegacyMenuModule as MatMenuModule } from '@angular/material/legacy-menu';
import { RouterModule } from '@angular/router';
import { SearchModule } from 'app/components/search/search.module';
import { FluytNavigationModule } from 'fluyt/components/navigation';
import { DefaultLayoutComponent } from './default-layout.component';
import { BreadcrumbModule } from 'app/components/breadcrumb/breadcrumb.module';
import { CommonModule } from '@angular/common';

@NgModule({
    declarations: [
        DefaultLayoutComponent
    ],
    imports: [
        HttpClientModule,
        RouterModule,
        MatButtonModule,
        MatDividerModule,
        MatIconModule,
        MatMenuModule,
        FluytNavigationModule,
        SearchModule,
        BreadcrumbModule,
        CommonModule
    ],
    exports: [
        DefaultLayoutComponent
    ]
})
export class DefaultLayoutModule {
}
