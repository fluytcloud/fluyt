import {Component} from "@angular/core";
import {ConfirmationService, MessageService} from "primeng/api";
import {Router} from "@angular/router";
import {CrudList} from "../../../../support/crud.list";
import {HeaderService} from "../../../../components/header/header.service";
import {Header} from "../../../../components/header/header";
import {Template} from "../template";
import {TemplateService} from "../template.service";

@Component({
  selector: 'app-service-template-list',
  templateUrl: './template.list.component.html'
})
export class TemplateListComponent extends CrudList<Template, Template> {

  constructor(private readonly serviceTemplateService: TemplateService,
              router: Router,
              headerService: HeaderService,
              messageService: MessageService,
              confirmationService: ConfirmationService) {
    super(headerService, router, messageService, confirmationService, serviceTemplateService);
  }

  getHeader(): Header {
    return {
      name: 'Service template list',
      breadcrumbs: [
        {
          label: 'Catalog',
          link: '/catalog'
        },
        {
          label: 'Service template list',
          link: '/catalog/template'
        }
      ]
    };
  }

}
