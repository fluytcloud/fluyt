import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FluytHighlightComponent } from 'core/components/highlight/highlight.component';

@NgModule({
    declarations: [
        FluytHighlightComponent
    ],
    imports     : [
        CommonModule
    ],
    exports     : [
        FluytHighlightComponent
    ]
})
export class FluytHighlightModule
{
}
