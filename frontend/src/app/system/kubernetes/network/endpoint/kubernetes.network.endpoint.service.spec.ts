import { TestBed } from '@angular/core/testing';

import { KubernetesNetworkEndpointService } from './kubernetes.network.endpoint.service';

describe('KubernetesNetworkEndpointService', () => {
  let service: KubernetesNetworkEndpointService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(KubernetesNetworkEndpointService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
