import {Component, OnInit} from "@angular/core";
import {ActivatedRoute} from "@angular/router";
import {FormBuilder, Validators} from "@angular/forms";
import {HeaderService} from "../../../../components/header/header.service";
import {MessageService} from "primeng/api";
import {CompanyService} from "../company.service";
import {Location} from "@angular/common";
import {CrudForm} from "../../../../support/crud.form";
import {Company} from "../company";
import {CompanyList} from "../company.list";
import {Header} from "../../../../components/header/header";

@Component({
  selector: "app-system-settings-company-form",
  templateUrl: "./company.form.component.html"
})
export class CompanyFormComponent extends CrudForm<Company, CompanyList> implements OnInit {

  constructor(private readonly companyService: CompanyService,
              activatedRoute: ActivatedRoute,
              formBuilder: FormBuilder,
              headerService: HeaderService,
              messageService: MessageService,
              location: Location) {
    super(formBuilder, activatedRoute, headerService, messageService, location, companyService, {
      id: [null],
      companyName: [null, [Validators.required]],
      tradeName: [null, [Validators.required]],
      email: [null, [Validators.required]]
    });
  }

  ngOnInit(): void {
    this.onInit();
  }

  getHeader(): Header {
    return {
      name: 'Company form',
      breadcrumbs: [
        {
          label: 'Settings',
          link: '/settings'
        },
        {
          label: 'Company list',
          link: '/settings/company'
        },
        {
          label: 'form',
          link: '/settings/company/form'
        }
      ]
    };
  }

}
