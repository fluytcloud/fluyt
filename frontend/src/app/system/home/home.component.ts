import {Component, OnInit} from "@angular/core";
import {HeaderService} from "../../components/header/header.service";

@Component({
  selector: "app-system-home",
  templateUrl: "./home.component.html",
  styleUrls: ["./home.component.scss"]
})
export class HomeComponent implements OnInit {

  constructor(private readonly headerService: HeaderService) {
  }

  ngOnInit(): void {
    this.headerService.notifyHeader({
      name: "Página inicial",
      breadcrumbs: [
        {
          label: 'Home',
          link: '/home'
        }
      ]
    });
  }

}
