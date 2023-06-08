import { Route } from '@angular/router';
import { ChangelogComponent } from 'app/modules/docs/changelog/changelog';

export const changelogRoutes: Route[] = [
    {
        path     : '',
        component: ChangelogComponent
    }
];
