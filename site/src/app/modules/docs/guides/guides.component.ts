import { ChangeDetectionStrategy, ChangeDetectorRef, Component, OnDestroy, OnInit, ViewChild, ViewEncapsulation } from '@angular/core';
import { MatDrawer } from '@angular/material/sidenav';
import { FluytNavigationItem } from 'fluyt/components/navigation';
import { takeUntil } from 'rxjs/operators';
import { Subject } from 'rxjs';
import { BreakpointObserver, BreakpointState, Breakpoints } from '@angular/cdk/layout';

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
        private _responsive: BreakpointObserver,
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
                    }
                ]
            },
        ];
    }

    ngOnInit(): void {
        this._responsive.observe([
            Breakpoints.Handset
        ])
            .pipe(takeUntil(this._unsubscribeAll))
            .subscribe(result => {
                this.setDrawerConfig(this.getDrawerConfigByChanges(result.matches));
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

    private getDrawerConfigByChanges(isHandset: boolean): DrawerConfig {
        if (isHandset) {
            return {
                drawerMode: 'over',
                drawerOpened: false
            };
        }
        return {
            drawerMode: 'side',
            drawerOpened: true
        };
    }

}
