import { NgModule, Optional, SkipSelf } from '@angular/core';
import { MATERIAL_SANITY_CHECKS } from '@angular/material/core';
import { MAT_FORM_FIELD_DEFAULT_OPTIONS } from '@angular/material/form-field';
import { FluytSplashScreenModule } from 'fluyt/services/splash-screen/splash-screen.module';
import { FluytUtilsModule } from 'fluyt/services/utils/utils.module';

@NgModule({
    imports: [
        FluytSplashScreenModule,
        FluytUtilsModule
    ],
    providers: [
        {
            // Disable 'theme' sanity check
            provide: MATERIAL_SANITY_CHECKS,
            useValue: {
                doctype: true,
                theme: false,
                version: true
            }
        },
        {
            // Use the 'fill' appearance on Angular Material form fields by default
            provide: MAT_FORM_FIELD_DEFAULT_OPTIONS,
            useValue: {
                appearance: 'fill'
            }
        }
    ]
})
export class FluytModule {

    constructor(@Optional() @SkipSelf() parentModule?: FluytModule) {
        if (parentModule) {
            throw new Error('FluytModule has already been loaded. Import this module in the AppModule only!');
        }
    }
}
