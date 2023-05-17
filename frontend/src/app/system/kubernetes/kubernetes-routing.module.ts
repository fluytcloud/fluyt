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
import {
  KubernetesWorkloadDaemonSetListComponent
} from "./workload/daemon-set/list/kubernetes.workload.daemon-set.list.component";
import {
  KubernetesWorkloadDaemonSetDetailComponent
} from "./workload/daemon-set/detail/kubernetes.workload.daemon-set.detail.component";
import {
  KubernetesWorkloadCronJobListComponent
} from "./workload/cron-job/list/kubernetes.workload.cron-job.list.component";
import {
  KubernetesWorkloadCronJobDetailComponent
} from "./workload/cron-job/detail/kubernetes.workload.cron-job.detail.component";
import {KubernetesWorkloadJobListComponent} from "./workload/job/list/kubernetes.workload.job.list.component";
import {KubernetesWorkloadJobDetailComponent} from "./workload/job/detail/kubernetes.workload.job.detail.component";
import {
  KubernetesNetworkEndpointListComponent
} from './network/endpoint/list/kubernetes.network.endpoint.list.component';
import {
  KubernetesNetworkEndpointDetailComponent
} from './network/endpoint/detail/kubernetes.network.endpoint.detail.component';
import {
  KubernetesConfigHorizontalPodAutoscalerListComponent
} from "./config/horizontal-pod-autoscaler/list/kubernetes.config.horizontal-pod-autoscaler.list.component";
import {
  KubernetesConfigHorizontalPodAutoscalerDetailComponent
} from "./config/horizontal-pod-autoscaler/detail/kubernetes.config.horizontal-pod-autoscaler.detail.component";
import {KubernetesNetworkIngressListComponent} from "./network/ingress/list/kubernetes.network.ingress.list.component";
import {
  KubernetesNetworkIngressDetailComponent
} from "./network/ingress/detail/kubernetes.network.ingress.detail.component";
import {KubernetesNetworkServiceListComponent} from "./network/service/list/kubernetes.network.service.list.component";
import {
  KubernetesNetworkServiceDetailComponent
} from "./network/service/detail/kubernetes.network.service.detail.component";
import {
  KubernetesAccessControlRoleBindingListComponent
} from "./access-control/role-binding/list/kubernetes.access-control.role-binding.list.component";
import {
  KubernetesAccessControlRoleBindingDetailComponent
} from "./access-control/role-binding/detail/kubernetes.access-control.role-binding.detail.component";


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
  },
  {
    path: 'daemon-sets',
    canActivate: [KubernetesClusterGuard],
    component: KubernetesWorkloadDaemonSetListComponent
  },
  {
    path: 'daemon-sets/detail',
    canActivate: [KubernetesClusterGuard],
    component: KubernetesWorkloadDaemonSetDetailComponent
  },
  {
    path: 'cron-jobs',
    canActivate: [KubernetesClusterGuard],
    component: KubernetesWorkloadCronJobListComponent
  },
  {
    path: 'cron-jobs/detail',
    canActivate: [KubernetesClusterGuard],
    component: KubernetesWorkloadCronJobDetailComponent
  },
  {
    path: 'jobs',
    canActivate: [KubernetesClusterGuard],
    component: KubernetesWorkloadJobListComponent
  },
  {
    path: 'jobs/detail',
    canActivate: [KubernetesClusterGuard],
    component: KubernetesWorkloadJobDetailComponent
  },
  {
    path: 'endpoints',
    canActivate: [KubernetesClusterGuard],
    component: KubernetesNetworkEndpointListComponent
  },
  {
    path: 'endpoints/detail',
    canActivate: [KubernetesClusterGuard],
    component: KubernetesNetworkEndpointDetailComponent
  },
  {
    path: 'horizontal-pod-autoscalers',
    canActivate: [KubernetesClusterGuard],
    component: KubernetesConfigHorizontalPodAutoscalerListComponent
  },
  {
    path: 'horizontal-pod-autoscalers/detail',
    canActivate: [KubernetesClusterGuard],
    component: KubernetesConfigHorizontalPodAutoscalerDetailComponent
  },
  {
    path: 'ingresses',
    canActivate: [KubernetesClusterGuard],
    component: KubernetesNetworkIngressListComponent
  },
  {
    path: 'ingresses/detail',
    canActivate: [KubernetesClusterGuard],
    component: KubernetesNetworkIngressDetailComponent
  },
  {
    path: 'services',
    canActivate: [KubernetesClusterGuard],
    component: KubernetesNetworkServiceListComponent
  },
  {
    path: 'services/detail',
    canActivate: [KubernetesClusterGuard],
    component: KubernetesNetworkServiceDetailComponent
  },
  {
    path: 'role-bindings',
    canActivate: [KubernetesClusterGuard],
    component: KubernetesAccessControlRoleBindingListComponent
  },
  {
    path: 'role-bindings/detail',
    canActivate: [KubernetesClusterGuard],
    component: KubernetesAccessControlRoleBindingDetailComponent
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class KubernetesRoutingModule { }
