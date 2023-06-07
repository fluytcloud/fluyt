import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { MatButtonModule } from '@angular/material/button';
import { MatIconModule } from '@angular/material/icon';
import { MatSidenavModule } from '@angular/material/sidenav';
import { MatTreeModule } from '@angular/material/tree';
import { FluytHighlightModule } from 'core/components/highlight';
import { FluytAlertModule } from 'core/components/alert';
import { FluytNavigationModule } from 'core/components/navigation';
import { FluytScrollResetModule } from 'core/directives/scroll-reset';
import { SharedModule } from 'app/shared/shared.module';
import { GuidesComponent } from 'app/modules/docs/guides/guides.component';
import { IntroductionComponent } from 'app/modules/docs/guides/getting-started/introduction/introduction';
import { PrerequisitesComponent } from 'app/modules/docs/guides/getting-started/prerequisites/prerequisites';
import { InstallationComponent } from 'app/modules/docs/guides/getting-started/installation/installation';
import { ServingComponent } from 'app/modules/docs/guides/getting-started/serving/serving';
import { DirectoryStructureComponent } from 'app/modules/docs/guides/development/directory-structure/directory-structure';
import { ComponentStructureComponent } from 'app/modules/docs/guides/development/component-structure/component-structure';
import { StarterKitComponent } from 'app/modules/docs/guides/development/starter-kit/starter-kit';
import { DeploymentComponent } from 'app/modules/docs/guides/development/deployment/deployment';
import { UpdatingComponent } from 'app/modules/docs/guides/development/updating/updating';
import { JwtComponent } from 'app/modules/docs/guides/authentication/jwt/jwt';
import { guidesRoutes } from 'app/modules/docs/guides/guides.routing';
import { BreadcrumbModule } from 'app/layout/common/breadcrumb/breadcrumb.module';

@NgModule({
    declarations: [
        GuidesComponent,
        IntroductionComponent,
        PrerequisitesComponent,
        InstallationComponent,
        ServingComponent,
        DirectoryStructureComponent,
        ComponentStructureComponent,
        StarterKitComponent,
        DeploymentComponent,
        UpdatingComponent,
        JwtComponent
    ],
    imports     : [
        RouterModule.forChild(guidesRoutes),
        MatButtonModule,
        MatIconModule,
        MatSidenavModule,
        MatTreeModule,
        FluytHighlightModule,
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
