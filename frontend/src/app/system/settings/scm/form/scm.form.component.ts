import {Component} from "@angular/core";
import {ActivatedRoute} from "@angular/router";
import {FormBuilder, Validators} from "@angular/forms";
import {MessageService} from "primeng/api";
import {Location} from "@angular/common";
import {Scm} from "../scm";
import {ScmService} from "../scm.service";
import {ScmType} from "../scm.type";
import {CrudForm} from "../../../../support/crud.form";
import {OptionDropdown} from "../../../../components/dropdown/option/option.dropdown";
import {HeaderService} from "../../../../components/header/header.service";
import {Header} from "../../../../components/header/header";

@Component({
  selector: 'app-scm-form',
  templateUrl: './scm.form.component.html'
})
export class ScmFormComponent extends CrudForm<Scm, Scm> {

  types: OptionDropdown[] = [];

  constructor(private readonly scmService: ScmService,
              activatedRoute: ActivatedRoute,
              formBuilder: FormBuilder,
              headerService: HeaderService,
              messageService: MessageService,
              location: Location) {
    super(formBuilder, activatedRoute, headerService, messageService, location, scmService, {
      id: [null],
      type: [null, [Validators.required]],
      name: [null, [Validators.required]],
      url: [null],
      username: [null, [Validators.required]],
      token: [null],
      organization: [null]
    });

    Object.values(ScmType).forEach(it => {
      this.types.push({
        value: it,
        label: it
      })
    });
  }

  getHeader(): Header {
    return {
      name: 'SCM form',
      breadcrumbs: [
        {
          label: 'Settings',
          link: '/settings'
        },
        {
          label: 'SCM list',
          link: '/settings/scm'
        },
        {
          label: 'form',
          link: '/settings/scm/form'
        }
      ]
    };
  }
}
