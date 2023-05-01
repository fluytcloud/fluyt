import {Component, OnInit} from "@angular/core";
import {HeaderService} from "../header/header.service";

@Component({
  selector: 'app-forbidden',
  templateUrl: './forbidden.component.html',
  styleUrls: ['./forbidden.component.scss']
})
export class ForbiddenComponent implements OnInit {

  constructor(private readonly headerService: HeaderService) {
  }

  ngOnInit(): void {
    this.headerService.notifyHeader({
      name: "Sem acesso",
      breadcrumbs: [
        {
          label: 'Sem acesso',
          link: '/forbidden'
        }
      ]
    });
  }

}
