import { Injectable } from '@angular/core';
import { KubernetesSupportService } from '../../support/kubernetes.support.service';
import { HttpClient } from '@angular/common/http';
import { environment } from 'src/environments/environment';

@Injectable({
  providedIn: 'root'
})
export class KubernetesNetworkEndpointService extends KubernetesSupportService<string> {
  
  constructor(http: HttpClient) {
    super(http);
  }
  
  override getUrl(): string {
    return `${environment.system_v1}/kubernetes/endpoint`;
  }


}
