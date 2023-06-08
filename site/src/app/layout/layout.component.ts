import { DOCUMENT } from '@angular/common';
import { Component, Inject, OnInit, Renderer2, ViewEncapsulation } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Layout } from 'app/layout/layout.types';

// TODO: refatorar tudo, não precisa ser assim
@Component({
    selector: 'layout',
    templateUrl: './layout.component.html',
    styleUrls: ['./layout.component.scss'],
    encapsulation: ViewEncapsulation.None
})
export class LayoutComponent implements OnInit {
    layout: Layout;

    constructor(
        @Inject(DOCUMENT) private _document: any,
        private _renderer2: Renderer2,
        private _route: ActivatedRoute,
    ) {
        this.layout = _route.snapshot.data['layout'] || 'empty';
    }

    ngOnInit(): void {
        this._renderer2.setAttribute(this._document.querySelector('[ng-version]'), 'fluyt-version', '0.1');
    }

}
