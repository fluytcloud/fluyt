import { NgModule } from '@angular/core';
import { FluytUtilsService } from 'fluyt/services/utils/utils.service';

@NgModule({
    providers: [
        FluytUtilsService
    ]
})
export class FluytUtilsModule
{

    constructor(private _fluytUtilsService: FluytUtilsService)
    {
    }
}
