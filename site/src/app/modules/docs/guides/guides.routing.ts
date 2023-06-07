import { Route } from '@angular/router';
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

export const guidesRoutes: Route[] = [
    {
        path     : '',
        component: GuidesComponent,
        children : [
            {
                path      : '',
                pathMatch : 'full',
                redirectTo: 'getting-started'
            },
            {
                path    : 'getting-started',
                children: [
                    {
                        path      : '',
                        pathMatch : 'full',
                        redirectTo: 'introduction'
                    },
                    {
                        path     : 'introduction',
                        component: IntroductionComponent
                    },
                    {
                        path     : 'prerequisites',
                        component: PrerequisitesComponent
                    },
                    {
                        path     : 'installation',
                        component: InstallationComponent
                    },
                    {
                        path     : 'serving',
                        component: ServingComponent
                    }
                ]
            },
            {
                path    : 'development',
                children: [
                    {
                        path      : '',
                        pathMatch : 'full',
                        redirectTo: 'structure'
                    },
                    {
                        path     : 'directory-structure',
                        component: DirectoryStructureComponent
                    },
                    {
                        path     : 'component-structure',
                        component: ComponentStructureComponent
                    },
                    {
                        path     : 'starter-kit',
                        component: StarterKitComponent
                    },
                    {
                        path     : 'deployment',
                        component: DeploymentComponent
                    },
                    {
                        path     : 'updating',
                        component: UpdatingComponent
                    }
                ]
            },
            {
                path    : 'authentication',
                children: [
                    {
                        path      : '',
                        pathMatch : 'full',
                        redirectTo: 'jwt'
                    },
                    {
                        path     : 'jwt',
                        component: JwtComponent
                    }
                ]
            }
        ]
    }
];
