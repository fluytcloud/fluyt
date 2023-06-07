import { NgModule } from '@angular/core';
import { FluytFindByKeyPipe } from 'core/pipes/find-by-key/find-by-key.pipe';

@NgModule({
    declarations: [
        FluytFindByKeyPipe
    ],
    exports     : [
        FluytFindByKeyPipe
    ]
})
export class FluytFindByKeyPipeModule
{
}
