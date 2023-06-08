/* eslint-disable @typescript-eslint/explicit-function-return-type */
import { Route } from '@angular/router';
import { LayoutComponent } from 'app/layout/layout.component';


export const appRoutes: Route[] = [

    { path: '', pathMatch: 'full', redirectTo: 'home' },
    {
        path: '',
        component: LayoutComponent,
        data: {
            layout: 'default'
        },
        children: [
            {
                path: 'home', loadChildren: () =>
                    import('app/modules/landing/home/home.module').then(m => m.LandingHomeModule)
            },
            // Documentation
            {
                path: 'docs', children: [

                    // Changelog
                    {
                        path: 'changelog', loadChildren: () =>
                            import('app/modules/docs/changelog/changelog.module').then(m => m.ChangelogModule)
                    },

                    // Guides
                    {
                        path: 'guides', loadChildren: () =>
                            import('app/modules/docs/guides/guides.module').then(m => m.GuidesModule)
                    }
                ]
            },

            // 404 & Catch all
            // { path: '404-not-found', pathMatch: 'full', loadChildren: () => import('app/modules/admin/pages/error/error-404/error-404.module').then(m => m.Error404Module) },
            { path: '**', redirectTo: '404-not-found' },
        ]
    },
];
