import { HttpClientModule } from '@angular/common/http';
import { NgModule } from '@angular/core';
import { MatButtonModule } from '@angular/material/button';
import { MatDividerModule } from '@angular/material/divider';
import { MatIconModule } from '@angular/material/icon';
import { MatMenuModule } from '@angular/material/menu';
import { RouterModule } from '@angular/router';
import { SearchModule } from 'app/layout/common/search/search.module';
import { SharedModule } from 'app/shared/shared.module';
import { FluytFullscreenModule } from 'core/components/fullscreen';
import { FluytLoadingBarModule } from 'core/components/loading-bar';
import { FluytNavigationModule } from 'core/components/navigation';
import { DefaultLayoutComponent } from './default-layout.component';
import { BreadcrumbModule } from 'app/layout/common/breadcrumb/breadcrumb.module';

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
        FluytFullscreenModule,
        FluytLoadingBarModule,
        FluytNavigationModule,
        SearchModule,
        SharedModule,
        BreadcrumbModule
    ],
    exports: [
        DefaultLayoutComponent
    ]
})
export class DefaultLayoutModule {
}
