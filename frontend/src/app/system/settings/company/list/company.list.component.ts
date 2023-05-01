import {Component, OnInit} from "@angular/core";
import {HeaderService} from "../../../../components/header/header.service";
import {CompanyService} from "../company.service";
import {CompanyList} from "../company.list";
import {CrudList} from "../../../../support/crud.list";
import {Company} from "../company";
import {Router} from "@angular/router";
import {ConfirmationService, MessageService} from "primeng/api";
import {Header} from "../../../../components/header/header";

@Component({
  selector: "app-system-settings-company-list",
  templateUrl: "./company.list.component.html"
})
export class CompanyListComponent  extends CrudList<Company, CompanyList> implements OnInit {

  constructor(private readonly companyService: CompanyService,
              router: Router,
              headerService: HeaderService,
              messageService: MessageService,
              confirmationService: ConfirmationService) {
    super(headerService, router, messageService, confirmationService, companyService);
  }

  ngOnInit(): void {
    super.onInit();
  }

  getHeader(): Header {
    return {
      name: 'Company list',
      breadcrumbs: [
        {
          label: 'Settings',
          link: '/settings'
        },
        {
          label: 'Company list',
          link: '/settings/company'
        }
      ]
    };
  }


}
