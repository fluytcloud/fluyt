import {Component, OnInit} from "@angular/core";
import {HeaderService} from "../../components/header/header.service";

@Component({
  selector: 'app-admin-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss']
})
export class HomeComponent implements OnInit{

  constructor(private readonly headerService: HeaderService) {
  }

  ngOnInit(): void {
    this.headerService.notifyHeader({
      name: "Pagina incial",
      breadcrumbs: [
        {
          label: 'Página inicial',
          link: '/admin/home'
        }
      ]
    });
  }

}
