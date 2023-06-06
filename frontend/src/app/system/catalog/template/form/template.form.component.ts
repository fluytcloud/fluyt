import {Component} from "@angular/core";
import {ActivatedRoute} from "@angular/router";
import {FormBuilder, Validators} from "@angular/forms";
import {MessageService} from "primeng/api";
import {Location} from "@angular/common";
import {CrudForm} from "../../../../support/crud.form";
import {HeaderService} from "../../../../components/header/header.service";
import {Header} from "../../../../components/header/header";
import {Template} from "../template";
import {TemplateService} from "../template.service";
import {Scm} from "../../../settings/scm/scm";
import {ScmService} from "../../../settings/scm/scm.service";

@Component({
  selector: 'app-service-template-form',
  templateUrl: './template.form.component.html'
})
export class TemplateFormComponent extends CrudForm<Template, Template> {

  filteredScm: Scm[] = [];

  constructor(private readonly serviceTemplateService: TemplateService,
              private readonly scmService: ScmService,
              activatedRoute: ActivatedRoute,
              formBuilder: FormBuilder,
              headerService: HeaderService,
              messageService: MessageService,
              location: Location) {
    super(formBuilder, activatedRoute, headerService, messageService, location, serviceTemplateService, {
      id: [null],
      name: [null, [Validators.required]],
      templateScm: [null, [Validators.required]],
      templateRepository: [null, [Validators.required]],
      templateBranch: [null, [Validators.required]],
      targetScm: [null, [Validators.required]],
      targetBranch: [null, [Validators.required]]
    });
  }

  getHeader(): Header {
    return {
      name: 'Service template form',
      breadcrumbs: [
        {
          label: 'Catalog',
          link: '/catalog'
        },
        {
          label: 'Service template list',
          link: '/catalog/template'
        },
        {
          label: 'form',
          link: '/catalog/template/form'
        }
      ]
    };
  }

  filterScm(event: any) {
    this.scmService.search(event.query).subscribe(e => this.filteredScm = e);
  }
}
