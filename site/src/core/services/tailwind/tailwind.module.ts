import { NgModule } from '@angular/core';
import { FluytTailwindService } from 'core/services/tailwind/tailwind.service';

@NgModule({
    providers: [
        FluytTailwindService
    ]
})
export class FluytTailwindConfigModule
{
    /**
     * Constructor
     */
    constructor(private _fluytTailwindConfigService: FluytTailwindService)
    {
    }
}
