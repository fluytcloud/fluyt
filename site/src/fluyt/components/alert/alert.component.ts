import { ChangeDetectionStrategy, ChangeDetectorRef, Component, EventEmitter, HostBinding, Input, OnChanges, OnDestroy, OnInit, Output, SimpleChanges, ViewEncapsulation } from '@angular/core';
import { Subject } from 'rxjs';
import { filter, takeUntil } from 'rxjs/operators';
import { BooleanInput, coerceBooleanProperty } from '@angular/cdk/coercion';
import { fluytAnimations } from 'fluyt/animations';
import { FluytAlertAppearance, FluytAlertType } from 'fluyt/components/alert/alert.types';
import { FluytAlertService } from 'fluyt/components/alert/alert.service';
import { FluytUtilsService } from 'fluyt/services/utils/utils.service';

@Component({
    selector: 'fluyt-alert',
    templateUrl: './alert.component.html',
    styleUrls: ['./alert.component.scss'],
    encapsulation: ViewEncapsulation.None,
    changeDetection: ChangeDetectionStrategy.OnPush,
    animations: fluytAnimations,
    exportAs: 'fluytAlert'
})
export class FluytAlertComponent implements OnChanges, OnInit, OnDestroy {
    /* eslint-disable @typescript-eslint/naming-convention */
    static ngAcceptInputType_dismissible: BooleanInput;
    static ngAcceptInputType_dismissed: BooleanInput;
    static ngAcceptInputType_showIcon: BooleanInput;
    /* eslint-enable @typescript-eslint/naming-convention */

    @Input() appearance: FluytAlertAppearance = 'soft';
    @Input() dismissed: boolean = false;
    @Input() dismissible: boolean = false;
    @Input() name: string = this._fluytUtilsService.randomId();
    @Input() showIcon: boolean = true;
    @Input() type: FluytAlertType = 'primary';
    @Output() readonly dismissedChanged: EventEmitter<boolean> = new EventEmitter<boolean>();

    private _unsubscribeAll: Subject<any> = new Subject<any>();

    
    constructor(
        private _changeDetectorRef: ChangeDetectorRef,
        private _fluytAlertService: FluytAlertService,
        private _fluytUtilsService: FluytUtilsService
    ) {
    }


    @HostBinding('class') get classList(): any {
        return {
            'fluyt-alert-appearance-border': this.appearance === 'border',
            'fluyt-alert-appearance-fill': this.appearance === 'fill',
            'fluyt-alert-appearance-outline': this.appearance === 'outline',
            'fluyt-alert-appearance-soft': this.appearance === 'soft',
            'fluyt-alert-dismissed': this.dismissed,
            'fluyt-alert-dismissible': this.dismissible,
            'fluyt-alert-show-icon': this.showIcon,
            'fluyt-alert-type-primary': this.type === 'primary',
            'fluyt-alert-type-accent': this.type === 'accent',
            'fluyt-alert-type-warn': this.type === 'warn',
            'fluyt-alert-type-basic': this.type === 'basic',
            'fluyt-alert-type-info': this.type === 'info',
            'fluyt-alert-type-success': this.type === 'success',
            'fluyt-alert-type-warning': this.type === 'warning',
            'fluyt-alert-type-error': this.type === 'error'
        };
    }


    
    ngOnChanges(changes: SimpleChanges): void {
        if ('dismissed' in changes) {
            this.dismissed = coerceBooleanProperty(changes.dismissed.currentValue);

            this._toggleDismiss(this.dismissed);
        }

        if ('dismissible' in changes) {
            this.dismissible = coerceBooleanProperty(changes.dismissible.currentValue);
        }

        if ('showIcon' in changes) {
            this.showIcon = coerceBooleanProperty(changes.showIcon.currentValue);
        }
    }

    
    ngOnInit(): void {
        this._fluytAlertService.onDismiss
            .pipe(
                filter(name => this.name === name),
                takeUntil(this._unsubscribeAll)
            )
            .subscribe(() => {

                this.dismiss();
            });

        this._fluytAlertService.onShow
            .pipe(
                filter(name => this.name === name),
                takeUntil(this._unsubscribeAll)
            )
            .subscribe(() => {

                this.show();
            });
    }

    ngOnDestroy(): void {
        this._unsubscribeAll.next();
        this._unsubscribeAll.complete();
    }

    dismiss(): void {
        if (!this.dismissed) {
            this._toggleDismiss(true);
        }

    }


    show(): void {
        if (this.dismissed) {
            this._toggleDismiss(false);
        }
    }


    private _toggleDismiss(dismissed: boolean): void {
        if (!this.dismissible) {
            return;
        }

        this.dismissed = dismissed;
        this.dismissedChanged.next(this.dismissed);
        this._changeDetectorRef.markForCheck();
    }
}
