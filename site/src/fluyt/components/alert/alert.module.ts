import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { MatLegacyButtonModule as MatButtonModule } from '@angular/material/legacy-button';
import { MatIconModule } from '@angular/material/icon';
import { FluytAlertComponent } from 'fluyt/components/alert/alert.component';

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
