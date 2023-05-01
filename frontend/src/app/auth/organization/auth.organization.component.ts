import {Component, OnInit} from "@angular/core";
import {MessageService} from "primeng/api";
import {KeycloakService} from "keycloak-angular";
import {AuthOrganizationService} from "./auth.organization.service";
import {AuthOrganization} from "./auth.organization";

@Component({
  selector: "app-auth-organization",
  templateUrl: "./auth.organization.component.html",
  styleUrls: ["./auth.organization.component.scss"]
})
export class AuthOrganizationComponent implements OnInit {

  organizations?: AuthOrganization[];
  displayContent: boolean = false;

  constructor(private readonly authService: AuthOrganizationService,
              private readonly keycloakService: KeycloakService,
              private readonly messageService: MessageService) {
  }

  ngOnInit(): void {
    this.authService.getOrganizations().subscribe(res => {
      res.sort((a, b) => a.name < b.name ? -1 : 1);
      this.organizations = res;
      this.displayContent = true;
    });
  }

  selectOrganization(identifier: string): void {
    this.displayContent = false;
    this.authService.completeFullAuthentication(identifier).subscribe({
      next: () => this.authService.notifySelectedOrganization(true),
      error: error => {
        if ('AccessDeniedException' === error.error.type) {
          this.messageService.add({
            severity:'error',
            summary: 'Erro',
            detail: 'Acesso negado'
          });
        }
      },
      complete: () => this.displayContent = true
    });

    this.authService.completeFullAuthentication(identifier).subscribe(() => {
      this.authService.notifySelectedOrganization(true);
    });
  }

  logout(): void {
    this.keycloakService.logout();
  }

}
