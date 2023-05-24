import {Injectable} from '@angular/core';
import {KubernetesSupportService} from '../../support/kubernetes.support.service';
import {HttpClient} from '@angular/common/http';
import {environment} from 'src/environments/environment';
import {KubernetesNetworkEndpointList} from "./kubernetes.network.endpoint.list";

@Injectable({
  providedIn: 'root'
})
export class KubernetesNetworkEndpointService extends KubernetesSupportService<KubernetesNetworkEndpointList> {

  constructor(http: HttpClient) {
    super(http);
  }

  override getUrl(): string {
    return `${environment.system_v1}/kubernetes/endpoint`;
  }


}
