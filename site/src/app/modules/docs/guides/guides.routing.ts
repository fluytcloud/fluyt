import { Route } from '@angular/router';
import { GuidesComponent } from 'app/modules/docs/guides/guides.component';
import { IntroductionComponent } from 'app/modules/docs/guides/getting-started/introduction/introduction';

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

                ]
            },
        ]
    }
];
