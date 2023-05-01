import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, RouterStateSnapshot, UrlTree, Router } from '@angular/router';
import { KeycloakAuthGuard, KeycloakService } from 'keycloak-angular';

@Injectable({
  providedIn: 'root'
})
export class AuthGuard extends KeycloakAuthGuard {

  constructor(
    protected override readonly router: Router,
    protected readonly keycloak: KeycloakService
  ) {
    super(router, keycloak);
  }

  async isAccessAllowed(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Promise<boolean | UrlTree> {
    if (!this.authenticated) {
      await this.keycloak.login({
        redirectUri: window.location.origin + state.url,
      });
    }

    if (state.url === '/' &&  this.keycloak.isUserInRole('administrator')) {
      await this.router.navigate(['admin/']);
      return true;
    }

    const roles = route.data['roles'];
    if (roles && !roles.some((role: string) => this.keycloak.isUserInRole(role))) {
      await this.router.navigate(['forbidden']);
      return false;
    }

    return this.authenticated;
  }
}
