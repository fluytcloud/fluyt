import { ComponentFixture, TestBed } from '@angular/core/testing';

import { KubernetesNetworkEndpointDetailComponent } from './kubernetes.network.endpoint.detail.component';

describe('KubernetesNetworkEndpointDetailComponent', () => {
  let component: KubernetesNetworkEndpointDetailComponent;
  let fixture: ComponentFixture<KubernetesNetworkEndpointDetailComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ KubernetesNetworkEndpointDetailComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(KubernetesNetworkEndpointDetailComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
