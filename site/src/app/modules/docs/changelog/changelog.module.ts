import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { BreadcrumbModule } from 'app/components/breadcrumb/breadcrumb.module';
import { ChangelogComponent } from 'app/modules/docs/changelog/changelog';
import { changelogRoutes } from 'app/modules/docs/changelog/changelog.routing';

@NgModule({
    declarations: [
        ChangelogComponent
    ],
    imports: [
        RouterModule.forChild(changelogRoutes),
        BreadcrumbModule,
    ]
})
export class ChangelogModule {
}
