import { ChangeDetectionStrategy, ChangeDetectorRef, Component, OnDestroy, OnInit, ViewChild, ViewEncapsulation } from '@angular/core';
import { MatDrawer } from '@angular/material/sidenav';
import { FluytNavigationItem } from 'fluyt/components/navigation';
import { takeUntil } from 'rxjs/operators';
import { Subject } from 'rxjs';
import { FluytMediaWatcherService } from 'fluyt/services/media-watcher';

type DrawerConfig = {
    drawerMode: 'side' | 'over';
    drawerOpened: boolean;
};

@Component({
    selector: 'guides',
    templateUrl: './guides.component.html',
    styleUrls: ['./guides.component.scss'],
    encapsulation: ViewEncapsulation.None,
    changeDetection: ChangeDetectionStrategy.OnPush
})
export class GuidesComponent implements OnInit, OnDestroy {
    @ViewChild('matDrawer', { static: true }) matDrawer: MatDrawer;
    menuData: FluytNavigationItem[];
    drawerConfig: DrawerConfig;
    private _unsubscribeAll: Subject<any> = new Subject<any>();


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
        ];
    }

    ngOnInit(): void {
        this._fluytMediaWatcherService.onMediaChange$
            .pipe(takeUntil(this._unsubscribeAll))
            .subscribe(({ matchingAliases }) => {
                this.setDrawerConfig(this.getDrawerConfigByChanges(matchingAliases));
                this._changeDetectorRef.markForCheck();
            });
    }

    ngOnDestroy(): void {
        this._unsubscribeAll.next();
        this._unsubscribeAll.complete();
    }

    private setDrawerConfig(config: DrawerConfig): void {
        this.drawerConfig = config;
    }

    private getDrawerConfigByChanges(matchingAliases: string[]): DrawerConfig {
        if (matchingAliases.includes('md')) {
            return {
                drawerMode: 'side',
                drawerOpened: true
            };
        }
        return {
            drawerMode: 'over',
            drawerOpened: false
        };
    }

}
