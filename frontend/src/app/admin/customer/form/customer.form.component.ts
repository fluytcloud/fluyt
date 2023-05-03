import {Component} from "@angular/core";
import {ActivatedRoute} from "@angular/router";
import {FormBuilder, Validators} from "@angular/forms";
import {HeaderService} from "../../../components/header/header.service";
import {MessageService} from "primeng/api";
import {Location} from "@angular/common";
import {CrudForm} from "../../../support/crud.form";
import {Customer} from "../customer";
import {CustomerList} from "../customer.list";
import {Header} from "../../../components/header/header";
import {CustomerService} from "../customer.service";

@Component({
  selector: 'app-admin-customer-form',
  templateUrl: './customer.form.component.html',
  styleUrls: ['./customer.form.component.scss']
})
export class CustomerFormComponent extends CrudForm<Customer, CustomerList> {

  constructor(private readonly customerService: CustomerService,
              activatedRoute: ActivatedRoute,
              formBuilder: FormBuilder,
              headerService: HeaderService,
              messageService: MessageService,
              location: Location) {
    super(formBuilder, activatedRoute, headerService, messageService, location, customerService, {
      id: [null],
      companyName: [null, [Validators.required]],
      tradeName: [null, [Validators.required]],
      email: [null, [Validators.required]],
      active: [null]
    });
  }

  getHeader(): Header {
    return {
      name: 'Customer form',
      breadcrumbs: [
        {
          label: 'Customers',
          link: '/admin/customer'
        },
        {
          label: 'form',
          link: '/admin/customer/form'
        }
      ]
    };
  }

}
