import { Route } from '@angular/router';
import { GuidesComponent } from 'app/modules/docs/guides/guides.component';
import { IntroductionComponent } from 'app/modules/docs/guides/getting-started/introduction/introduction';
import { PrerequisitesComponent } from 'app/modules/docs/guides/getting-started/prerequisites/prerequisites';
import { InstallationComponent } from 'app/modules/docs/guides/getting-started/installation/installation';
import { ServingComponent } from 'app/modules/docs/guides/getting-started/serving/serving';

export const guidesRoutes: Route[] = [
    {
        path: '',
        component: GuidesComponent,
        children: [
            {
                path: '',
                pathMatch: 'full',
                redirectTo: 'getting-started'
            },
            {
                path: 'getting-started',
                data: {
                    breadcrumb: 'Getting Started',
                    isAbstract: true,
                },
                children: [
                    {
                        path: '',
                        pathMatch: 'full',
                        redirectTo: 'introduction'
                    },
                    {
                        path: 'introduction',
                        component: IntroductionComponent,
                        data: {
                            breadcrumb: 'Introduction'
                        },
                    },
                    {
                        path: 'prerequisites',
                        component: PrerequisitesComponent,
                        data: {
                            breadcrumb: 'Prerequisites'
                        },
                    },
                    {
                        path: 'installation',
                        component: InstallationComponent,
                        data: {
                            breadcrumb: 'Instalation'
                        },
                    },
                    {
                        path: 'serving',
                        component: ServingComponent,
                        data: {
                            breadcrumb: 'Serving'
                        },
                    }
                ]
            },
        ]
    }
];
