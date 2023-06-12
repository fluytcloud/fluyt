import { Component, OnInit } from '@angular/core';
import BreadcrumbItem from './BreadcrumbItem';
import { ActivatedRoute, Event, NavigationEnd, Route, Router } from '@angular/router';
import { filter, distinctUntilChanged } from 'rxjs/operators';


@Component({
  selector: 'breadcrumb',
  templateUrl: './breadcrumb.component.html',
})
export class BreadcrumbComponent implements OnInit {

  public breadcrumbs: BreadcrumbItem[];

  constructor(
    private router: Router,
    private activatedRoute: ActivatedRoute,
  ) {
    this.breadcrumbs = this.buildBreadCrumb(this.activatedRoute.root);
  }

  ngOnInit(): void {
    this.router.events.pipe(
      filter((event: Event) => event instanceof NavigationEnd),
      distinctUntilChanged(),
    ).subscribe(() => {
      this.breadcrumbs = this.buildBreadCrumb(this.activatedRoute.root);
    });
  }

  private buildBreadCrumb(route: ActivatedRoute, url: string = '', breadcrumbs: BreadcrumbItem[] = []): BreadcrumbItem[] {
    const breadcrumbItem = this.getBreadcrumbItem(route, url);
    const newBreadcrumbs = breadcrumbItem.label ? [...breadcrumbs, breadcrumbItem] : [...breadcrumbs];
    if (route.firstChild) {
      return this.buildBreadCrumb(route.firstChild, breadcrumbItem.url, newBreadcrumbs);
    }
    return newBreadcrumbs;
  }

  private getBreadcrumbItem(route: ActivatedRoute, url: string = ''): BreadcrumbItem {
    const routeConfig = route.routeConfig;
    const labelAux = routeConfig && routeConfig.data ? routeConfig.data.breadcrumb : '';
    const isClickable = routeConfig && routeConfig.data && routeConfig.data.isClickable;
    const pathAux = routeConfig && routeConfig.data ? routeConfig.path : '';

    const { label, path } = this.getLabelAndPath(pathAux, labelAux, route);
    const nextUrl = path ? `${url}/${path}` : url;

    return {
      label,
      isClickable,
      url: nextUrl,
    };
  }

  private getLabelAndPath(path: string, label: string, route: ActivatedRoute): { label: string; path: string } {
    const lastRoutePart = path.split('/').pop();
    const isDynamicRoute = lastRoutePart.startsWith(':');
    if (isDynamicRoute && !!route.snapshot) {
      const paramName = lastRoutePart.split(':')[1];
      path = path.replace(lastRoutePart, route.snapshot.params[paramName]);
      label = route.snapshot.params[paramName];
    }
    return { path, label };
  }
}
