import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FluytMasonryComponent } from 'core/components/masonry/masonry.component';

@NgModule({
    declarations: [
        FluytMasonryComponent
    ],
    imports     : [
        CommonModule
    ],
    exports     : [
        FluytMasonryComponent
    ]
})
export class FluytMasonryModule
{
}
