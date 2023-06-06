import {Component, OnInit} from "@angular/core";
import {finalize} from "rxjs";
import {MessageService} from "primeng/api";
import {Location} from "@angular/common";
import {ActivatedRoute, Router} from "@angular/router";
import {Template} from "../template";
import {TemplateService} from "../template.service";
import {Page} from "../../../../support/page";
import {HeaderService} from "../../../../components/header/header.service";

@Component({
  selector: 'app-service-template-catalog',
  templateUrl: './template.catalog.component.html',
  styleUrls: ['./template.catalog.component.scss']
})
export class TemplateCatalogComponent implements OnInit {

  catalogs?: Page<Template>;
  display = false;

  first: number = 0;
  rows: number = 10;

  constructor(private serviceTemplateService: TemplateService,
              private activatedRoute: ActivatedRoute,
              private router: Router,
              private messageService: MessageService,
              private location: Location,
              private headerService: HeaderService) {
  }


  ngOnInit(): void {
    this.headerService.notifyHeader({
      name: `Service template catalog`,
      breadcrumbs: [
        {
          label: 'Catalog',
          link: '/catalog'
        },
        {
          label: 'Service template catalog',
          link: '/catalog/generate'
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

    this.serviceTemplateService.findAll(pageNumber, pageSize)
      .pipe(finalize(() => this.display = true))
      .subscribe(catalogs => this.catalogs = catalogs);
  }

  select(catalog: Template): void {
    this.router.navigate([`/catalog/generate/${catalog.id}`]);
  }
}
