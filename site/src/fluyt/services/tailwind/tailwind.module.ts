import { NgModule } from '@angular/core';
import { FluytTailwindService } from 'fluyt/services/tailwind/tailwind.service';

@NgModule({
    providers: [
        FluytTailwindService
    ]
})
export class FluytTailwindConfigModule
{

    constructor(private _fluytTailwindConfigService: FluytTailwindService)
    {
    }
}
