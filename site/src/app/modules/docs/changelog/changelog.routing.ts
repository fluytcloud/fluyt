import { Route } from '@angular/router';
import { ChangelogComponent } from 'app/modules/docs/changelog/changelog.component';

export const changelogRoutes: Route[] = [
    {
        path: '',
        component: ChangelogComponent
    }
];
