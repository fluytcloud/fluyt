import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FluytDrawerComponent } from 'core/components/drawer/drawer.component';

@NgModule({
    declarations: [
        FluytDrawerComponent
    ],
    imports     : [
        CommonModule
    ],
    exports     : [
        FluytDrawerComponent
    ]
})
export class FluytDrawerModule
{
}
