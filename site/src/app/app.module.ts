import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { ExtraOptions, PreloadAllModules, RouterModule } from '@angular/router';
import { MarkdownModule } from 'ngx-markdown';
import { AppComponent } from 'app/app.component';
import { appRoutes } from 'app/app.routing';
import { LayoutModule } from 'app/layout/layout.module';
import { FluytModule } from 'fluyt/fluyt.module';
import { IconsModule } from 'fluyt/components/icons/icons.module';
import { CommonModule } from '@angular/common';

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
        IconsModule,
        LayoutModule,
        MarkdownModule.forRoot({}),
        CommonModule,
    ],
    bootstrap: [
        AppComponent
    ]
})
export class AppModule {
}
