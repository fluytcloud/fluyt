import {Component, OnInit} from "@angular/core";
import {MessageService} from "primeng/api";
import {KeycloakService} from "keycloak-angular";
import {AuthCompanyService} from "./auth.company.service";
import {AuthCompany} from "./auth.company";

@Component({
  selector: "app-auth-company",
  templateUrl: "./auth.company.component.html",
  styleUrls: ["./auth.company.component.scss"]
})
export class AuthCompanyComponent implements OnInit {

  companies?: AuthCompany[];
  displayContent: boolean = false;

  constructor(private readonly authService: AuthCompanyService,
              private readonly keycloakService: KeycloakService,
              private readonly messageService: MessageService) {
  }

  ngOnInit(): void {
    this.authService.getCompanies().subscribe(res => {
      res.sort((a, b) => a.name < b.name ? -1 : 1);
      this.companies = res;
      this.displayContent = true;
    });
  }

  selectCompany(id: number): void {
    this.displayContent = false;
    this.authService.changeCompany(id).subscribe({
      next: () => this.authService.notifySelectedCompanySubject(true),
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

    this.authService.changeCompany(id).subscribe(() => {
      this.authService.notifySelectedCompanySubject(true);
    });
  }

  logout(): void {
    this.keycloakService.logout();
  }

}
