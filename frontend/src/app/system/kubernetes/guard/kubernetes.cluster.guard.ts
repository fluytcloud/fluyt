import {Injectable} from '@angular/core';
import {ActivatedRouteSnapshot, CanActivate, Router, RouterStateSnapshot, UrlTree} from '@angular/router';
import {Observable} from "rxjs";

@Injectable()
export class KubernetesClusterGuard implements CanActivate {

  constructor(private readonly router: Router) {
  }

  canActivate(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<boolean | UrlTree> | Promise<boolean | UrlTree> | boolean | UrlTree {
    const queryClusterId = route.queryParams['cluster']!;
    if (queryClusterId) {
      sessionStorage.setItem('cluster', queryClusterId);
      return true;
    }

    const sessionClusterId = sessionStorage.getItem('cluster');
    if (sessionClusterId) {
      const urlTree = this.router.parseUrl(state.url);
      urlTree.queryParams['cluster'] = sessionClusterId;
      return urlTree;
    }

    this.router.navigate(['kubernetes/catalog'], {queryParams: {redirectUrl: state.url}});
    return false;
  }

}
