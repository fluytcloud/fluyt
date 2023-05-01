import {FormValidator} from "./form.validator";
import {ActivatedRoute} from "@angular/router";
import {UntypedFormBuilder, ɵFormGroupRawValue} from "@angular/forms";
import {HeaderService} from "../components/header/header.service";
import {MessageService} from "primeng/api";
import {Location} from "@angular/common";
import {Header} from "../components/header/header";
import {CrudService} from "./crud.service";
import {finalize} from "rxjs";

export abstract class CrudForm<T, LIST> extends FormValidator{

  display: boolean = true;

  protected constructor(public formBuilder: UntypedFormBuilder,
                        public activatedRoute: ActivatedRoute,
                        public headerService: HeaderService,
                        public messageService: MessageService,
                        public location: Location,
                        public crudService: CrudService<T, LIST>,
                        public controlsConfig: {[key: string]: any;}) {
    super(formBuilder, controlsConfig);
  }

  abstract getHeader(): Header;

  back(): void {
    this.location.back();
  }

  onInit(): void {
    this.headerService.notifyHeader(this.getHeader());

    const id = this.activatedRoute.snapshot.paramMap.get('id');
    if (id) {
      this.display = false;
      this.crudService.findById(id)
        .pipe(finalize(() => this.display = true))
        .subscribe({
        next: object => {
          this.setFormValue(object);
        },
        error: error => console.log(error)
      });
    }
  }

  setFormValue(value: T) {
    this.form.setValue(value as ɵFormGroupRawValue<any>);
  }

  getFormValue(): T {
    return this.form.value;
  }

  preSave(): void {}

  save(): void {
    this.preSave();
    const newRegister = !this.form.value.id;
    this.crudService.persist(this.form.value.id, this.getFormValue()).subscribe(object => {
      this.setFormValue(object);
      if (newRegister) {
        this.location.go(`${this.location.path()}/${this.form.value.id}`);
      }

      this.messageService.add({
        severity: 'info',
        summary: 'Sucesso',
        detail: newRegister ? 'Registro inserido com sucesso' : 'Registro atualizado com sucesso'
      });
    }, (error) => {
      this.messageService.add({
        severity: 'error',
        summary: 'Erro',
        detail: error?.error.message
      });
    });
  }

}
