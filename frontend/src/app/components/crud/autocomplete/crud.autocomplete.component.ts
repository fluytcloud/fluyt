import {Component, Input, OnInit} from "@angular/core";
import {FormControl, FormGroupDirective} from "@angular/forms";
import {CrudService} from "../../../support/crud.service";

@Component({
  selector: "app-crud-autocomplete",
  templateUrl: "./crud.autocomplete.component.html"
})
export class CrudAutocompleteComponent implements OnInit {

  list: any[] = [];
  value: any[] = [];

  @Input() label!: string;
  @Input() inputId!: string;
  @Input() crudService!: CrudService<any, any>;
  @Input() field: string = "name";
  @Input() required: boolean = false;
  @Input() multiple: boolean = false;
  @Input() controlName?: string | number | null;

  form?: FormControl;

  constructor(private rootFormGroup: FormGroupDirective) {
  }

  ngOnInit(): void {
    if (this.controlName) {
      this.form = this.rootFormGroup.control.get('' + this.controlName!) as FormControl;
    }
  }

  search(event: any) {
    this.crudService.search(event.query)
      .subscribe({
        next: value => this.list = value
      })
  }

  isValid(): boolean {
    if (this.form) {
      return this.form.valid;
    }
    return this.required ? this.value.length > 0 : true;
  }

}
