import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { KubernetesNetworkEndpointListComponent } from './list/kubernetes.network.endpoint.list.component';
import { KubernetesNetworkEndpointDetailComponent } from './detail/kubernetes.network.endpoint.detail.component';
import { KubernetesNetworkEndpointService } from './kubernetes.network.endpoint.service';



@NgModule({
  declarations: [
    KubernetesNetworkEndpointListComponent,
    KubernetesNetworkEndpointDetailComponent
  ],
  imports: [
    CommonModule
  ],
  providers: [
    KubernetesNetworkEndpointService
  ]
})
export class KubernetesNetworkEndpointModule { }
