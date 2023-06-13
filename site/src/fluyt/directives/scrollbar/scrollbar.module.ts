import { NgModule } from '@angular/core';
import { FluytScrollbarDirective } from 'fluyt/directives/scrollbar/scrollbar.directive';

@NgModule({
    declarations: [
        FluytScrollbarDirective
    ],
    exports     : [
        FluytScrollbarDirective
    ]
})
export class FluytScrollbarModule
{
}
