import {Injectable} from "@angular/core";
import {HttpClient} from "@angular/common/http";
import {Observable, retry, Subject} from "rxjs";
import {environment} from "../../../environments/environment";
import {KeycloakService} from "keycloak-angular";
import {UserInfo} from "../user.info";
import {AuthOrganization} from "./auth.organization";

@Injectable()
export class AuthOrganizationService {

  selectedOrganizationSubject = new Subject<boolean>();

  constructor(private readonly http: HttpClient,
              private readonly keycloakService: KeycloakService) {
  }

  notifySelectedOrganization(selected: boolean): void {
    this.selectedOrganizationSubject.next(selected);
  }

  getSelectedOrganizationSubject(): Subject<boolean> {
    return this.selectedOrganizationSubject;
  }

  fullAuthentication(): Observable<boolean> {
    const url = `${environment.auth}/full-authentication`;
    return this.http.get<boolean>(url);
  }

  getOrganizations(): Observable<AuthOrganization[]> {
    return this.http.get<AuthOrganization[]>(environment.organizations).pipe(retry(3));
  }

  completeFullAuthentication(identifier: string): Observable<void> {
    const url = `${environment.auth}/full-authentication`;
    return this.http.post<void>(url, identifier);
  }

  get(): Observable<UserInfo> {
    return this.http.get<UserInfo>(environment.auth).pipe(retry(3));
  }

  logout(): void {
    const url = `${environment.auth}/logout`;
    this.http.post<void>(url, null)
      .subscribe(() => this.keycloakService.logout());
  }

}
