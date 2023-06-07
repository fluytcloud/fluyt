import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FluytCardComponent } from 'core/components/card/card.component';

@NgModule({
    declarations: [
        FluytCardComponent
    ],
    imports     : [
        CommonModule
    ],
    exports     : [
        FluytCardComponent
    ]
})
export class FluytCardModule
{
}
