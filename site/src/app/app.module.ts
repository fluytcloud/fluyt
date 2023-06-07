import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { ExtraOptions, PreloadAllModules, RouterModule } from '@angular/router';
import { MarkdownModule } from 'ngx-markdown';

import { CoreModule } from 'app/core/core.module';

import { AppComponent } from 'app/app.component';
import { appRoutes } from 'app/app.routing';
import { LayoutModule } from 'app/layout/layout.module';
import { FluytModule } from 'core/fluyt.module';

const routerConfig: ExtraOptions = {
    preloadingStrategy: PreloadAllModules,
    scrollPositionRestoration: 'enabled'
};

@NgModule({
    declarations: [
        AppComponent
    ],
    imports: [
        BrowserModule,
        BrowserAnimationsModule,
        RouterModule.forRoot(appRoutes, routerConfig),
        FluytModule,
        CoreModule,
        LayoutModule,
        MarkdownModule.forRoot({})
    ],
    bootstrap: [
        AppComponent
    ]
})
export class AppModule {
}
