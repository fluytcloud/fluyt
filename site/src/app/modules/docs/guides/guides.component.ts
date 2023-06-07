import { ChangeDetectionStrategy, ChangeDetectorRef, Component, OnDestroy, OnInit, ViewChild, ViewEncapsulation } from '@angular/core';
import { MatDrawer } from '@angular/material/sidenav';
import { FluytNavigationItem } from 'core/components/navigation';
import { takeUntil } from 'rxjs/operators';
import { FluytMediaWatcherService } from 'core/services/media-watcher';
import { Subject } from 'rxjs';

@Component({
    selector: 'guides',
    templateUrl: './guides.component.html',
    styleUrls: ['./guides.component.scss'],
    encapsulation: ViewEncapsulation.None,
    changeDetection: ChangeDetectionStrategy.OnPush
})
export class GuidesComponent implements OnInit, OnDestroy {
    @ViewChild('matDrawer', { static: true }) matDrawer: MatDrawer;
    drawerMode: 'side' | 'over';
    drawerOpened: boolean;
    menuData: FluytNavigationItem[];
    private _unsubscribeAll: Subject<any> = new Subject<any>();

    /**
     * Constructor
     */
    constructor(
        private _changeDetectorRef: ChangeDetectorRef,
        private _fluytMediaWatcherService: FluytMediaWatcherService
    ) {
        this.menuData = [
            {
                id: 'getting-started',
                title: 'Getting started',
                type: 'group',
                children: [
                    {
                        id: 'getting-started.introduction',
                        title: 'Introduction',
                        type: 'basic',
                        link: '/docs/guides/getting-started/introduction'
                    },
                    {
                        id: 'getting-started.prerequisites',
                        title: 'Prerequisites',
                        type: 'basic',
                        link: '/docs/guides/getting-started/prerequisites'
                    },
                    {
                        id: 'getting-started.installation',
                        title: 'Installation',
                        type: 'basic',
                        link: '/docs/guides/getting-started/installation'
                    },
                    {
                        id: 'getting-started.serving',
                        title: 'Serving',
                        type: 'basic',
                        link: '/docs/guides/getting-started/serving'
                    }
                ]
            },
            {
                id: 'development',
                title: 'Development',
                type: 'group',
                children: [
                    {
                        id: 'development.directory-structure',
                        title: 'Directory structure',
                        type: 'basic',
                        link: '/docs/guides/development/directory-structure'
                    },
                    {
                        id: 'development.component-structure',
                        title: 'Component structure',
                        type: 'basic',
                        link: '/docs/guides/development/component-structure'
                    },
                    {
                        id: 'development.starter-kit',
                        title: 'Starter kit',
                        type: 'basic',
                        link: '/docs/guides/development/starter-kit'
                    },
                    {
                        id: 'development.deployment',
                        title: 'Deployment',
                        type: 'basic',
                        link: '/docs/guides/development/deployment'
                    },
                    {
                        id: 'development.updating',
                        title: 'Updating',
                        type: 'basic',
                        link: '/docs/guides/development/updating'
                    }
                ]
            },
            {
                id: 'authentication',
                title: 'Authentication',
                type: 'group',
                children: [
                    {
                        id: 'authentication.jwt',
                        title: 'JWT',
                        type: 'basic',
                        link: '/docs/guides/authentication/jwt'
                    }
                ]
            }
        ];
    }

    ngOnInit(): void {
        // Subscribe to media query change
        this._fluytMediaWatcherService.onMediaChange$
            .pipe(takeUntil(this._unsubscribeAll))
            .subscribe(({ matchingAliases }) => {

                // Set the drawerMode and drawerOpened
                if (matchingAliases.includes('md')) {
                    this.drawerMode = 'side';
                    this.drawerOpened = true;
                }
                else {
                    this.drawerMode = 'over';
                    this.drawerOpened = false;
                }

                // Mark for check
                this._changeDetectorRef.markForCheck();
            });
    }

    /**
     * On destroy
     */
    ngOnDestroy(): void {
        // Unsubscribe from all subscriptions
        this._unsubscribeAll.next();
        this._unsubscribeAll.complete();
    }
}
