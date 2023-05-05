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
import {
  KubernetesWorkloadReplicaSetListComponent
} from "./workload/replica-set/list/kubernetes.workload.replica-set.list.component";
import {
  KubernetesWorkloadReplicaSetDetailComponent
} from "./workload/replica-set/detail/kubernetes.workload.replica-set.detail.component";
import {
  KubernetesWorkloadStatefulSetListComponent
} from "./workload/stateful-set/list/kubernetes.workload.stateful-set.list.component";
import {
  KubernetesWorkloadStatefulSetDetailComponent
} from "./workload/stateful-set/detail/kubernetes.workload.stateful-set.detail.component";


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
  },
  {
    path: 'replica-sets',
    canActivate: [KubernetesClusterGuard],
    component: KubernetesWorkloadReplicaSetListComponent
  },
  {
    path: 'replica-sets/detail',
    canActivate: [KubernetesClusterGuard],
    component: KubernetesWorkloadReplicaSetDetailComponent
  },
  {
    path: 'stateful-sets',
    canActivate: [KubernetesClusterGuard],
    component: KubernetesWorkloadStatefulSetListComponent
  },
  {
    path: 'stateful-sets/detail',
    canActivate: [KubernetesClusterGuard],
    component: KubernetesWorkloadStatefulSetDetailComponent
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class KubernetesRoutingModule { }
