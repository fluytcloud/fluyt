import {Component, ContentChild, Input, TemplateRef} from "@angular/core";
import {CrudList} from "../../../support/crud.list";

@Component({
  selector: 'app-crud-list',
  templateUrl: './crud.list.component.html'
})
export class CrudListComponent<T, LIST> {

  @ContentChild('header') header!: TemplateRef<any>;
  @ContentChild('body') body!: TemplateRef<any>;
  @Input() crudList!: CrudList<T, LIST>
  @Input() showButtonForm: boolean = true;


}
