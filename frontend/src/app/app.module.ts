import {APP_INITIALIZER, NgModule} from '@angular/core';

import {AppRoutingModule} from './app-routing.module';
import {AppComponent} from './app.component';
import {BrowserAnimationsModule} from "@angular/platform-browser/animations";
import {CommonModule} from "@angular/common";
import {HeaderService} from "./components/header/header.service";
import {initializeKeycloak} from "./auth/init/keycloak-init.factory";
import {KeycloakAngularModule, KeycloakService} from "keycloak-angular";
import {HttpClientModule} from "@angular/common/http";
import {ToastModule} from "primeng/toast";
import {ConfirmationService, MessageService} from "primeng/api";
import {ConfirmDialogModule} from "primeng/confirmdialog";
import {MenuService} from "./components/menu/menu.service";
import {MenuModule} from "./components/menu/menu.module";
import {LoaderModule} from "./components/loader/loader.module";
import {HeaderModule} from "./components/header/header.module";
import {AuthOrganizationModule} from "./auth/organization/auth.organization.module";
import {AuthOrganizationService} from "./auth/organization/auth.organization.service";
import {ForbiddenModule} from "./components/forbidden/forbidden.module";
import {AuthCompanyModule} from "./auth/company/auth.company.module";
import {AuthCompanyService} from "./auth/company/auth.company.service";
import {FooterModule} from "./components/footer/footer.module";
import {FooterService} from "./components/footer/footer.service";

@NgModule({
  declarations: [
    AppComponent
  ],
  imports: [
    BrowserAnimationsModule,
    AppRoutingModule,
    CommonModule,
    HttpClientModule,
    KeycloakAngularModule,
    ToastModule,
    ConfirmDialogModule,
    MenuModule,
    LoaderModule,
    HeaderModule,
    AuthOrganizationModule,
    ForbiddenModule,
    AuthCompanyModule,
    FooterModule
  ],
  providers: [
    {
      provide: APP_INITIALIZER,
      useFactory: initializeKeycloak,
      multi: true,
      deps: [KeycloakService],
    },
    AuthOrganizationService,
    MenuService,
    HeaderService,
    MessageService,
    ConfirmationService,
    AuthCompanyService,
    FooterService
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
