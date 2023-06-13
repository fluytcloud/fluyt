import { Component, OnDestroy, OnInit, ViewEncapsulation } from '@angular/core';
import { Subject } from 'rxjs';
import { FluytNavigationService, FluytVerticalNavigationComponent } from 'fluyt/components/navigation';
import { Navigation } from 'app/layout/layouts/default-layout/navigation/navigation.types';
import { defaultNavigation, horizontalNavigation } from 'app/layout/layouts/default-layout/navigation/data';
import { BreakpointObserver, Breakpoints } from '@angular/cdk/layout';
import { takeUntil } from 'rxjs/operators';

@Component({
    selector: 'default-layout',
    templateUrl: './default-layout.component.html',
    encapsulation: ViewEncapsulation.None
})
export class DefaultLayoutComponent implements OnInit, OnDestroy {
    isScreenSmall: boolean;
    navigation: Navigation = {
        horizontal: horizontalNavigation,
        default: defaultNavigation,
    };
    private _unsubscribeAll: Subject<any> = new Subject<any>();

    constructor(
        private _fluytNavigationService: FluytNavigationService,
        private _responsive: BreakpointObserver,
    ) {
    }

    get currentYear(): number {
        return new Date().getFullYear();
    }

    ngOnInit(): void {
        this._responsive.observe([
            Breakpoints.Handset,
            Breakpoints.Tablet,
        ])
            .pipe(takeUntil(this._unsubscribeAll))
            .subscribe(result => {
                this.isScreenSmall = result.matches;
            });
    }

    ngOnDestroy(): void {
        this._unsubscribeAll.next();
        this._unsubscribeAll.complete();
    }

    toggleNavigation(name: string): void {
        const navigation = this._fluytNavigationService.getComponent<FluytVerticalNavigationComponent>(name);

        if (navigation) {
            navigation.toggle();
        }
    }

    public openGitHub(): void {
        window.open('https://github.com/fluytcloud/fluyt', '_blank');
    }
}
