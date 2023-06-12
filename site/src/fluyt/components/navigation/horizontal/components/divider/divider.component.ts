import { ChangeDetectionStrategy, ChangeDetectorRef, Component, Input, OnDestroy, OnInit } from '@angular/core';
import { Subject } from 'rxjs';
import { takeUntil } from 'rxjs/operators';
import { FluytHorizontalNavigationComponent } from 'fluyt/components/navigation/horizontal/horizontal.component';
import { FluytNavigationService } from 'fluyt/components/navigation/navigation.service';
import { FluytNavigationItem } from 'fluyt/components/navigation/navigation.types';

@Component({
    selector       : 'fluyt-horizontal-navigation-divider-item',
    templateUrl    : './divider.component.html',
    changeDetection: ChangeDetectionStrategy.OnPush
})
export class FluytHorizontalNavigationDividerItemComponent implements OnInit, OnDestroy
{
    @Input() item: FluytNavigationItem;
    @Input() name: string;

    private _fluytHorizontalNavigationComponent: FluytHorizontalNavigationComponent;
    private _unsubscribeAll: Subject<any> = new Subject<any>();

    
    constructor(
        private _changeDetectorRef: ChangeDetectorRef,
        private _fluytNavigationService: FluytNavigationService
    )
    {
    }

    

    
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
