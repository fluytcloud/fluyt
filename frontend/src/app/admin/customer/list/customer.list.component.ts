import {Component} from "@angular/core";
import {CustomerService} from "../customer.service";
import {CustomerList} from "../customer.list";
import {HeaderService} from "../../../components/header/header.service";
import {ConfirmationService, MessageService} from "primeng/api";
import {Customer} from "../customer";
import {CrudList} from "../../../support/crud.list";
import {Router} from "@angular/router";
import {Header} from "../../../components/header/header";

@Component({
  selector: 'app-admin-customer-list',
  templateUrl: './customer.list.component.html'
})
export class CustomerListComponent extends CrudList<Customer, CustomerList> {

  constructor(private readonly customerService: CustomerService,
              router: Router,
              headerService: HeaderService,
              messageService: MessageService,
              confirmationService: ConfirmationService) {
    super(headerService, router, messageService, confirmationService, customerService);
  }

  getHeader(): Header {
    return {
      name: 'Customer list',
      breadcrumbs: [
        {
          label: 'Customer',
          link: '/admin/customer'
        }
      ]
    };
  }

  changeActive(customer: Customer): void {
    this.customerService.changeActive(customer.id).subscribe({
      next: () => {
        customer.active = !customer.active;
        this.messageService.add({
          severity: 'info',
          summary: 'Sucesso',
          detail: 'Status do cliente alterado com sucesso'
        });
      },
      error: error => {
        this.messageService.add({
          severity:'error',
          summary: 'Erro',
          detail: error.error.message
        });
      }
    })
  }

}
