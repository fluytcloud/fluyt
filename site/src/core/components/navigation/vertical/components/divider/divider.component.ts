import { ChangeDetectionStrategy, ChangeDetectorRef, Component, Input, OnDestroy, OnInit } from '@angular/core';
import { Subject } from 'rxjs';
import { takeUntil } from 'rxjs/operators';
import { FluytVerticalNavigationComponent } from 'core/components/navigation/vertical/vertical.component';
import { FluytNavigationService } from 'core/components/navigation/navigation.service';
import { FluytNavigationItem } from 'core/components/navigation/navigation.types';

@Component({
    selector       : 'fluyt-vertical-navigation-divider-item',
    templateUrl    : './divider.component.html',
    changeDetection: ChangeDetectionStrategy.OnPush
})
export class FluytVerticalNavigationDividerItemComponent implements OnInit, OnDestroy
{
    @Input() item: FluytNavigationItem;
    @Input() name: string;

    private _fluytVerticalNavigationComponent: FluytVerticalNavigationComponent;
    private _unsubscribeAll: Subject<any> = new Subject<any>();

    /**
     * Constructor
     */
    constructor(
        private _changeDetectorRef: ChangeDetectorRef,
        private _fluytNavigationService: FluytNavigationService
    )
    {
    }

    // -----------------------------------------------------------------------------------------------------
    // @ Lifecycle hooks
    // -----------------------------------------------------------------------------------------------------

    /**
     * On init
     */
    ngOnInit(): void
    {
        // Get the parent navigation component
        this._fluytVerticalNavigationComponent = this._fluytNavigationService.getComponent(this.name);

        // Subscribe to onRefreshed on the navigation component
        this._fluytVerticalNavigationComponent.onRefreshed.pipe(
            takeUntil(this._unsubscribeAll)
        ).subscribe(() => {

            // Mark for check
            this._changeDetectorRef.markForCheck();
        });
    }

    /**
     * On destroy
     */
    ngOnDestroy(): void
    {
        // Unsubscribe from all subscriptions
        this._unsubscribeAll.next();
        this._unsubscribeAll.complete();
    }
}
