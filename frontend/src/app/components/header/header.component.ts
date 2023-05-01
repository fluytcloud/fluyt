import {Component} from "@angular/core";
import {HeaderService} from "./header.service";
import {Header} from "./header";

@Component({
  selector: "app-header",
  templateUrl: "./header.component.html",
  styleUrls: ["./header.component.scss"]
})
export class HeaderComponent {

  header?: Header;

  constructor(private readonly headerService: HeaderService) {
    this.headerService.getHeaderSubject()
      .asObservable()
      .subscribe(it => this.header = it);
  }

}
