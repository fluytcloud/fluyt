import { NgModule } from '@angular/core';
import { FluytUtilsService } from 'core/services/utils/utils.service';

@NgModule({
    providers: [
        FluytUtilsService
    ]
})
export class FluytUtilsModule
{
    /**
     * Constructor
     */
    constructor(private _fluytUtilsService: FluytUtilsService)
    {
    }
}
