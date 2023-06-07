import { Directive, ElementRef, OnDestroy, OnInit } from '@angular/core';
import { NavigationEnd, Router } from '@angular/router';
import { Subject } from 'rxjs';
import { filter, takeUntil } from 'rxjs/operators';

@Directive({
    selector: '[fluytScrollReset]',
    exportAs: 'fluytScrollReset'
})
export class FluytScrollResetDirective implements OnInit, OnDestroy {
    private _unsubscribeAll: Subject<any> = new Subject<any>();


    constructor(
        private _elementRef: ElementRef,
        private _router: Router
    ) {
    }




    ngOnInit(): void {
        this._router.events.pipe(
            filter(event => event instanceof NavigationEnd),
            takeUntil(this._unsubscribeAll)
        ).subscribe(() => {

            this._elementRef.nativeElement.scrollTop = 0;
        });
    }


    ngOnDestroy(): void {
        this._unsubscribeAll.next();
        this._unsubscribeAll.complete();
    }
}
