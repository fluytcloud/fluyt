import { NgModule } from '@angular/core';
import { FluytMediaWatcherService } from 'core/services/media-watcher/media-watcher.service';

@NgModule({
    providers: [
        FluytMediaWatcherService
    ]
})
export class FluytMediaWatcherModule
{
    
    constructor(private _fluytMediaWatcherService: FluytMediaWatcherService)
    {
    }
}
