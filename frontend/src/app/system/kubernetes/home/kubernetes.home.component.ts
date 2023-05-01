import {Component, OnInit} from "@angular/core";
import {HeaderService} from "../../../components/header/header.service";

@Component({
  selector: 'app-kubernetes-home',
  templateUrl: './kubernetes.home.component.html',
  styleUrls: ['./kubernetes.home.component.scss']
})
export class KubernetesHomeComponent implements OnInit {

  constructor(private readonly headerService: HeaderService) {
  }

  ngOnInit(): void {
    this.headerService.notifyHeader({
      name: 'Kubernetes',
      breadcrumbs: [
        {
          label: 'Kubernetes',
          link: '/kubernetes'
        }
      ]
    });
  }


}
