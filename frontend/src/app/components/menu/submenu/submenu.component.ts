import {Component, Input} from "@angular/core";
import {Menu} from "../menu";
import {KeyValue} from "@angular/common";

@Component({
  selector: 'app-submenu',
  templateUrl: './submenu.component.html',
  styleUrls: ['./submenu.component.scss']
})
export class SubmenuComponent {

  @Input() parent!: Menu;

  originalOrder = (a: KeyValue<string, Menu[]>, b: KeyValue<string, Menu[]>): number => {
    return 0;
  }

}
