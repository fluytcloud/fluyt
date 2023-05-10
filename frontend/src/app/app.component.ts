import { Component } from '@angular/core';
import { KeycloakService } from "keycloak-angular";
import { ConfirmationService } from "primeng/api";
import { MenuService } from "./components/menu/menu.service";
import { AuthOrganizationService } from "./auth/organization/auth.organization.service";
import { AuthCompanyService } from "./auth/company/auth.company.service";

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent {

  extended: boolean = true;
  fullAuthentication: boolean = false;
  selectOrganization: boolean = false;
  selectCompany: boolean = false;
  displaySystem: boolean = false;
  footerIsOpen = false;

  constructor(private readonly menuService: MenuService,
    private readonly keycloakService: KeycloakService,
    private readonly authService: AuthOrganizationService,
    private readonly authCompanyService: AuthCompanyService,
    private readonly confirmationService: ConfirmationService) {
    this.menuService.getSubmenuSubject()
      .asObservable()
      .subscribe(it => this.extended = !it);

    this.authService.getSelectedOrganizationSubject()
      .asObservable()
      .subscribe(it => {
        this.getFullAuthentication();
      });

    this.authCompanyService.getSelectedCompanySubject()
      .asObservable()
      .subscribe(it => {
        this.fullAuthentication = it;
      });

    this.getFullAuthentication();
  }

  getFullAuthentication(): void {
    this.authService.fullAuthentication().subscribe({
      next: fullAuthentication => {
        this.fullAuthentication = fullAuthentication;
        this.displaySystem = true;
      },
      error: error => {
        if ('ChooseOrganizationException' === error.error.type) {
          this.fullAuthentication = false;
          this.selectCompany = false;
          this.displaySystem = true;
          this.selectOrganization = true;
        } else if ('EmptyOrganizationException' === error.error.type) {
          this.confirmationService.confirm({
            header: "Notificação",
            message: "Seu usuário não possui vinculos com nenhuma empresa",
            rejectVisible: false,
            acceptLabel: "Desconectar",
            acceptIcon: "pi pi-power-off",
            closeOnEscape: false,
            accept: () => {
              this.keycloakService.logout();
            }
          });
        } else if ('ChooseCompanyException' === error.error.type) {
          this.selectOrganization = false;
          this.fullAuthentication = false;
          this.selectCompany = true;
          this.displaySystem = true;
        } else if ('EmptyCompanyException' === error.error.type) {
          this.confirmationService.confirm({
            header: "Notificação",
            message: "Seu usuário não possui vínculos com nenhuma filial",
            rejectVisible: false,
            acceptLabel: "Desconectar",
            acceptIcon: "pi pi-power-off",
            closeOnEscape: false,
            accept: () => {
              this.keycloakService.logout();
            }
          });
        }
      }
    });
  }

}
