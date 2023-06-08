import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { MatButtonModule } from '@angular/material/button';
import { MatIconModule } from '@angular/material/icon';
import { FluytAlertComponent } from 'core/components/alert/alert.component';

@NgModule({
    declarations: [
        FluytAlertComponent
    ],
    imports     : [
        CommonModule,
        MatButtonModule,
        MatIconModule
    ],
    exports     : [
        FluytAlertComponent
    ]
})
export class FluytAlertModule
{
}
