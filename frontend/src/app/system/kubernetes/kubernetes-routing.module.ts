import {NgModule} from '@angular/core';
import {RouterModule, Routes} from '@angular/router';
import {KubernetesClusterListComponent} from "./cluster/list/kubernetes.cluster.list.component";
import {KubernetesClusterFormComponent} from "./cluster/form/kubernetes.cluster.form.component";
import {AuthGuard} from "../../auth/guard/auth.guard";
import {KubernetesWorkloadPodListComponent} from "./workload/pod/list/kubernetes.workload.pod.list.component";
import {KubernetesWorkloadPodDetailComponent} from "./workload/pod/detail/kubernetes.workload.pod.detail.component";
import {KubernetesClusterGuard} from "./guard/kubernetes.cluster.guard";
import {KubernetesCatalogComponent} from "./catalog/kubernetes.catalog.component";
import {
  KubernetesConfigConfigMapListComponent
} from "./config/config-map/list/kubernetes.config.config-map.list.component";
import {
  KubernetesConfigConfigMapDetailComponent
} from "./config/config-map/detail/kubernetes.config.config-map.detail.component";


const routes: Routes = [
  {
    path: 'catalog',
    component: KubernetesCatalogComponent
  },
  {
    path: 'cluster',
    canActivate: [AuthGuard],
    component: KubernetesClusterListComponent,
    data: {
      roles: ['manager']
    }
  },
  {
    path: 'cluster/form',
    canActivate: [AuthGuard],
    component: KubernetesClusterFormComponent,
    data: {
      roles: ['manager']
    }
  },
  {
    path: 'cluster/form/:id',
    canActivate: [AuthGuard],
    component: KubernetesClusterFormComponent,
    data: {
      roles: ['manager']
    }
  },
  {
    path: 'pods',
    canActivate: [KubernetesClusterGuard],
    component: KubernetesWorkloadPodListComponent
  },
  {
    path: 'pods/detail',
    canActivate: [KubernetesClusterGuard],
    component: KubernetesWorkloadPodDetailComponent
  },
  {
    path: 'config-maps',
    canActivate: [KubernetesClusterGuard],
    component: KubernetesConfigConfigMapListComponent
  },
  {
    path: 'config-maps/detail',
    canActivate: [KubernetesClusterGuard],
    component: KubernetesConfigConfigMapDetailComponent
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class KubernetesRoutingModule { }
