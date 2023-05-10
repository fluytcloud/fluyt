import { ComponentFixture, TestBed } from '@angular/core/testing';

import { KubernetesNetworkEndpointListComponent } from './kubernetes.network.endpoint.list.component';

describe('KubernetesNetworkEndpointListComponent', () => {
  let component: KubernetesNetworkEndpointListComponent;
  let fixture: ComponentFixture<KubernetesNetworkEndpointListComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ KubernetesNetworkEndpointListComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(KubernetesNetworkEndpointListComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
