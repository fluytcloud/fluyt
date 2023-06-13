import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { MatLegacyButtonModule as MatButtonModule } from '@angular/material/legacy-button';
import { MatIconModule } from '@angular/material/icon';
import { MatSidenavModule } from '@angular/material/sidenav';
import { MatTreeModule } from '@angular/material/tree';
import { GuidesComponent } from 'app/modules/docs/guides/guides.component';
import { IntroductionComponent } from 'app/modules/docs/guides/getting-started/introduction/introduction';
import { guidesRoutes } from 'app/modules/docs/guides/guides.routing';
import { BreadcrumbModule } from 'app/components/breadcrumb/breadcrumb.module';
import { FluytAlertModule } from 'fluyt/components/alert/alert.module';
import { FluytNavigationModule } from 'fluyt/components/navigation/navigation.module';
import { FluytScrollResetModule } from 'fluyt/directives/scroll-reset/scroll-reset.module';
//TODO: adicionar import { MarkdownModule } from 'ngx-markdown';

@NgModule({
    declarations: [
        GuidesComponent,
        IntroductionComponent,
    ],
    imports     : [
        RouterModule.forChild(guidesRoutes),
        // MarkdownModule.forRoot(),
        MatButtonModule,
        MatIconModule,
        MatSidenavModule,
        MatTreeModule,
        FluytAlertModule,
        FluytNavigationModule,
        FluytScrollResetModule,
        BreadcrumbModule,
    ]
})
export class GuidesModule
{
}
