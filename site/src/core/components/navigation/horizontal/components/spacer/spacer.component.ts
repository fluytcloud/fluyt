import { ChangeDetectionStrategy, ChangeDetectorRef, Component, Input, OnDestroy, OnInit } from '@angular/core';
import { takeUntil } from 'rxjs/operators';
import { Subject } from 'rxjs';
import { FluytHorizontalNavigationComponent } from 'core/components/navigation/horizontal/horizontal.component';
import { FluytNavigationService } from 'core/components/navigation/navigation.service';
import { FluytNavigationItem } from 'core/components/navigation/navigation.types';

@Component({
    selector       : 'fluyt-horizontal-navigation-spacer-item',
    templateUrl    : './spacer.component.html',
    changeDetection: ChangeDetectionStrategy.OnPush
})
export class FluytHorizontalNavigationSpacerItemComponent implements OnInit, OnDestroy
{
    @Input() item: FluytNavigationItem;
    @Input() name: string;

    private _fluytHorizontalNavigationComponent: FluytHorizontalNavigationComponent;
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
        this._fluytHorizontalNavigationComponent = this._fluytNavigationService.getComponent(this.name);

        // Subscribe to onRefreshed on the navigation component
        this._fluytHorizontalNavigationComponent.onRefreshed.pipe(
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
