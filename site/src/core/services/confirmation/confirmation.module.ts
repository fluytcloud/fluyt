import { NgModule } from '@angular/core';
import { MatButtonModule } from '@angular/material/button';
import { MatDialogModule } from '@angular/material/dialog';
import { MatIconModule } from '@angular/material/icon';
import { FluytConfirmationService } from 'core/services/confirmation/confirmation.service';
import { FluytConfirmationDialogComponent } from 'core/services/confirmation/dialog/dialog.component';
import { CommonModule } from '@angular/common';

@NgModule({
    declarations: [
        FluytConfirmationDialogComponent
    ],
    imports: [
        MatButtonModule,
        MatDialogModule,
        MatIconModule,
        CommonModule
    ],
    providers   : [
        FluytConfirmationService
    ]
})
export class FluytConfirmationModule
{
    /**
     * Constructor
     */
    constructor(private _fluytConfirmationService: FluytConfirmationService)
    {
    }
}
