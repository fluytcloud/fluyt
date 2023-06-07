import { NgModule } from '@angular/core';
import { FluytMediaWatcherService } from 'core/services/media-watcher/media-watcher.service';

@NgModule({
    providers: [
        FluytMediaWatcherService
    ]
})
export class FluytMediaWatcherModule
{
    /**
     * Constructor
     */
    constructor(private _fluytMediaWatcherService: FluytMediaWatcherService)
    {
    }
}
