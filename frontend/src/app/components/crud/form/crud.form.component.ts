import {Component, Input} from "@angular/core";
import {CrudForm} from "../../../support/crud.form";

@Component({
  selector: "app-crud-form",
  templateUrl: "./crud.form.component.html"
})
export class CrudFormComponent<T, LIST> {

  @Input() crudForm!: CrudForm<T, LIST>;

}
