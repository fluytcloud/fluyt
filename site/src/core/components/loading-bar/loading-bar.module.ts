import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { HTTP_INTERCEPTORS } from '@angular/common/http';
import { MatProgressBarModule } from '@angular/material/progress-bar';
import { FluytLoadingBarComponent } from 'core/components/loading-bar/loading-bar.component';
import { FluytLoadingBarInterceptor } from 'core/components/loading-bar/loading-bar.interceptor';

@NgModule({
    declarations: [
        FluytLoadingBarComponent
    ],
    imports     : [
        CommonModule,
        MatProgressBarModule
    ],
    exports     : [
        FluytLoadingBarComponent
    ],
    providers   : [
        {
            provide : HTTP_INTERCEPTORS,
            useClass: FluytLoadingBarInterceptor,
            multi   : true
        }
    ]
})
export class FluytLoadingBarModule
{
}
