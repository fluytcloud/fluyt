import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { MatButtonModule } from '@angular/material/button';
import { MatIconModule } from '@angular/material/icon';
import { MatSidenavModule } from '@angular/material/sidenav';
import { MatTreeModule } from '@angular/material/tree';
import { SharedModule } from 'app/shared/shared.module';
import { GuidesComponent } from 'app/modules/docs/guides/guides.component';
import { IntroductionComponent } from 'app/modules/docs/guides/getting-started/introduction/introduction';
import { PrerequisitesComponent } from 'app/modules/docs/guides/getting-started/prerequisites/prerequisites';
import { InstallationComponent } from 'app/modules/docs/guides/getting-started/installation/installation';
import { ServingComponent } from 'app/modules/docs/guides/getting-started/serving/serving';
import { guidesRoutes } from 'app/modules/docs/guides/guides.routing';
import { BreadcrumbModule } from 'app/layout/common/breadcrumb/breadcrumb.module';
import { FluytAlertModule } from 'fluyt/components/alert/alert.module';
import { FluytNavigationModule } from 'fluyt/components/navigation/navigation.module';
import { FluytScrollResetModule } from 'fluyt/directives/scroll-reset/scroll-reset.module';

@NgModule({
    declarations: [
        GuidesComponent,
        IntroductionComponent,
        PrerequisitesComponent,
        InstallationComponent,
        ServingComponent,
    ],
    imports     : [
        RouterModule.forChild(guidesRoutes),
        MatButtonModule,
        MatIconModule,
        MatSidenavModule,
        MatTreeModule,
        FluytAlertModule,
        FluytNavigationModule,
        FluytScrollResetModule,
        SharedModule,
        BreadcrumbModule,
    ]
})
export class GuidesModule
{
}
