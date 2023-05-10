import { Component } from '@angular/core';
import { KubernetesNetworkEndpointService } from '../kubernetes.network.endpoint.service';

@Component({
  selector: 'app-kubernetes.network.endpoint.list',
  templateUrl: './kubernetes.network.endpoint.list.component.html',
  styleUrls: ['./kubernetes.network.endpoint.list.component.scss']
})
export class KubernetesNetworkEndpointListComponent {

  constructor(private service: KubernetesNetworkEndpointService) {
    this.teste();
  }

  private teste(): void {
    this.service.find({clusterId: 1}).subscribe((result) => {
      console.log(result);
    });
  }

}
