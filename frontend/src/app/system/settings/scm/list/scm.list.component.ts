import {Component} from "@angular/core";
import {ConfirmationService, MessageService} from "primeng/api";
import {Router} from "@angular/router";
import {Scm} from "../scm";
import {ScmService} from "../scm.service";
import {CrudList} from "../../../../support/crud.list";
import {HeaderService} from "../../../../components/header/header.service";
import {Header} from "../../../../components/header/header";

@Component({
  selector: 'app-scm-list',
  templateUrl: './scm.list.component.html'
})
export class ScmListComponent extends CrudList<Scm, Scm> {

  constructor(private readonly scmService: ScmService,
              router: Router,
              headerService: HeaderService,
              messageService: MessageService,
              confirmationService: ConfirmationService) {
    super(headerService, router, messageService, confirmationService, scmService);
  }

  getHeader(): Header {
    return {
      name: 'SCM list',
      breadcrumbs: [
        {
          label: 'Settings',
          link: '/settings'
        },
        {
          label: 'SCM list',
          link: '/settings/scm'
        }
      ]
    };
  }

}
