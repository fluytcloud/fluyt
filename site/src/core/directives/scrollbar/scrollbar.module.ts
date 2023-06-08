import { NgModule } from '@angular/core';
import { FluytScrollbarDirective } from 'core/directives/scrollbar/scrollbar.directive';

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
