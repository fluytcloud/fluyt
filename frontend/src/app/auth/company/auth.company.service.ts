import {Injectable} from "@angular/core";
import {HttpClient} from "@angular/common/http";
import {Observable, retry, Subject} from "rxjs";
import {environment} from "../../../environments/environment";
import {KeycloakService} from "keycloak-angular";
import {AuthCompany} from "./auth.company";

@Injectable()
export class AuthCompanyService {

  selectedCompanySubject = new Subject<boolean>();

  constructor(private readonly http: HttpClient,
              private readonly keycloakService: KeycloakService) {
  }

  notifySelectedCompanySubject(fullAuthentication: boolean): void {
    this.selectedCompanySubject.next(fullAuthentication);
  }

  getSelectedCompanySubject(): Subject<boolean> {
    return this.selectedCompanySubject;
  }

  getSelectedCompany(): Subject<boolean> {
    return this.selectedCompanySubject;
  }

  getCompanies(): Observable<AuthCompany[]> {
    return this.http.get<AuthCompany[]>(environment.companies).pipe(retry(3));
  }

  changeCompany(id: number): Observable<void> {
    const url = `${environment.auth}/change-company`;
    return this.http.post<void>(url, id);
  }

  logout(): void {
    const url = `${environment.auth}/logout`;
    this.http.post<void>(url, null)
      .subscribe(() => this.keycloakService.logout());
  }

}
