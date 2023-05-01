import {Component, OnInit} from "@angular/core";
import {KubernetesCatalogService} from "./kubernetes.catalog.service";
import {KubernetesCatalog} from "./kubernetes.catalog";
import {finalize} from "rxjs";
import {Page} from "../../../support/page";
import {HeaderService} from "../../../components/header/header.service";
import {MessageService} from "primeng/api";
import {Location} from "@angular/common";
import {ActivatedRoute, Router} from "@angular/router";

@Component({
  selector: 'app-kubernetes-catalog',
  templateUrl: './kubernetes.catalog.component.html',
  styleUrls: ['./kubernetes.catalog.component.scss']
})
export class KubernetesCatalogComponent implements OnInit {

  catalogs?: Page<KubernetesCatalog>;
  display = false;

  first: number = 0;

  rows: number = 10;
  redirectUrl!: string;

  constructor(private kubernetesCatalogService: KubernetesCatalogService,
              private activatedRoute: ActivatedRoute,
              private router: Router,
              private messageService: MessageService,
              private location: Location,
              private headerService: HeaderService) {
  }


  ngOnInit(): void {
    this.redirectUrl = this.activatedRoute.snapshot.queryParams['redirectUrl']!;

    this.headerService.notifyHeader({
      name: `Cluster catalog`,
      breadcrumbs: [
        {
          label: 'Cluster catalog',
          link: '/kubernetes/catalog'
        }
      ]
    });

    this.load({
      first: 0,
      rows: this.rows
    });
  }

  load(event: any): void {
    const pageSize = event.rows!;
    const pageNumber = event.first! / pageSize;

    this.kubernetesCatalogService.get(pageNumber, pageSize)
      .pipe(finalize(() => this.display = true))
      .subscribe(catalogs => this.catalogs = catalogs);
  }

  select(catalog: KubernetesCatalog): void {
    sessionStorage.setItem('cluster', catalog.id.toString());
    this.messageService.add({
      severity: 'info',
      summary: 'Success',
      detail: 'Cluster successfully selected, now you can navigate between cluster objects'
    });

    this.router.navigate([this.redirectUrl]);
  }
}
