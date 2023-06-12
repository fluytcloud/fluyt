import { NgModule } from '@angular/core';
import { FluytScrollResetDirective } from 'fluyt/directives/scroll-reset/scroll-reset.directive';

@NgModule({
    declarations: [
        FluytScrollResetDirective
    ],
    exports     : [
        FluytScrollResetDirective
    ]
})
export class FluytScrollResetModule
{
}
