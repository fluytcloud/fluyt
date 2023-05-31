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
  KubernetesWorkloadDeploymentListComponent
} from "./workload/deployment/list/kubernetes.workload.deployment.list.component";
import {
  KubernetesWorkloadDeploymentDetailComponent
} from "./workload/deployment/detail/kubernetes.workload.deployment.detail.component";
import {
  KubernetesAccessControlRoleBindingListComponent
} from "./access-control/role-binding/list/kubernetes.access-control.role-binding.list.component";
import {
  KubernetesAccessControlRoleBindingDetailComponent
} from "./access-control/role-binding/detail/kubernetes.access-control.role-binding.detail.component";
import {
  KubernetesAccessControlServiceAccountListComponent
} from "./access-control/service-account/list/kubernetes.access-control.service-account.list.component";
import {
  KubernetesAccessControlServiceAccountDetailComponent
} from "./access-control/service-account/detail/kubernetes.access-control.service-account.detail.component";
import {
  KubernetesAccessControlRoleListComponent
} from "./access-control/role/list/kubernetes.access-control.role.list.component";
import {
  KubernetesAccessControlRoleDetailComponent
} from "./access-control/role/detail/kubernetes.access-control.role.detail.component";
import {
  KubernetesConfigResourceQuotaListComponent
} from "./config/resource-quota/list/kubernetes.config.resource-quota.list.component";
import {
  KubernetesConfigResourceQuotaDetailComponent
} from "./config/resource-quota/detail/kubernetes.config.resource-quota.detail.component";
import {
  KubernetesAccessControlClusterRoleListComponent
} from "./access-control/cluster-role/list/kubernetes.access-control.cluster-role.list.component";
import {
  KubernetesAccessControlClusterRoleDetailComponent
} from "./access-control/cluster-role/detail/kubernetes.access-control.cluster-role.detail.component";
import {
  KubernetesAccessControlClusterRoleBindingListComponent
} from "./access-control/cluster-role-binding/list/kubernetes.access-control.cluster-role-binding.list.component";
import {
  KubernetesAccessControlClusterRoleBindingDetailComponent
} from "./access-control/cluster-role-binding/detail/kubernetes.access-control.cluster-role-binding.detail.component";
import {
  KubernetesStoragePersistentVolumeClaimListComponent
} from "./storage/persistent-volume-claim/list/kubernetes.storage.persistent-volume-claim.list.component";
import {
  KubernetesStoragePersistentVolumeClaimDetailComponent
} from "./storage/persistent-volume-claim/detail/kubernetes.storage.persistent-volume-claim.detail.component";
import {
  KubernetesStoragePersistentVolumeListComponent
} from "./storage/persistent-volume/list/kubernetes.storage.persistent-volume.list.component";
import {
  KubernetesStoragePersistentVolumeDetailComponent
} from "./storage/persistent-volume/detail/kubernetes.storage.persistent-volume.detail.component";
import {
  KubernetesStorageStorageClassListComponent
} from "./storage/storage-class/list/kubernetes.storage.storage-class.list.component";
import {
  KubernetesStorageStorageClassDetailComponent
} from "./storage/storage-class/detail/kubernetes.storage.storage-class.detail.component";
import {KubernetesConfigSecretListComponent} from "./config/secret/list/kubernetes.config.secret.list.component";
import {KubernetesConfigSecretDetailComponent} from "./config/secret/detail/kubernetes.config.secret.detail.component";
import {
  KubernetesConfigLimitRangeListComponent
} from "./config/limit-range/list/kubernetes.config.limit-range.list.component";
import {
  KubernetesConfigLimitRangeDetailComponent
} from "./config/limit-range/detail/kubernetes.config.limit-range.detail.component";
import {KubernetesNodeListComponent} from "./node/list/kubernetes.node.list.component";
import {KubernetesNodeDetailComponent} from "./node/detail/kubernetes.node.detail.component";
import {KubernetesWorkloadOverviewComponent} from "./workload/overview/kubernetes.workload.overview.component";


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
    path: 'deployments',
    canActivate: [KubernetesClusterGuard],
    component: KubernetesWorkloadDeploymentListComponent
  },
  {
    path: 'deployments/detail',
    canActivate: [KubernetesClusterGuard],
    component: KubernetesWorkloadDeploymentDetailComponent
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
  },
  {
    path: 'service-accounts',
    canActivate: [KubernetesClusterGuard],
    component: KubernetesAccessControlServiceAccountListComponent
  },
  {
    path: 'service-accounts/detail',
    canActivate: [KubernetesClusterGuard],
    component: KubernetesAccessControlServiceAccountDetailComponent
  },
  {
    path: 'roles',
    canActivate: [KubernetesClusterGuard],
    component: KubernetesAccessControlRoleListComponent
  },
  {
    path: 'roles/detail',
    canActivate: [KubernetesClusterGuard],
    component: KubernetesAccessControlRoleDetailComponent
  },
  {
    path: 'endpoints',
    canActivate: [KubernetesClusterGuard],
    component: KubernetesNetworkEndpointListComponent
  },
  {
    path: 'endpoints/detail',
    canActivate: [KubernetesClusterGuard],
    component: KubernetesNetworkIngressDetailComponent
  },
  {
    path: 'resource-quotas',
    canActivate: [KubernetesClusterGuard],
    component: KubernetesConfigResourceQuotaListComponent
  },
  {
    path: 'resource-quotas/detail',
    canActivate: [KubernetesClusterGuard],
    component: KubernetesConfigResourceQuotaDetailComponent
  },
  {
    path: 'cluster-roles',
    canActivate: [KubernetesClusterGuard],
    component: KubernetesAccessControlClusterRoleListComponent
  },
  {
    path: 'cluster-roles/detail',
    canActivate: [KubernetesClusterGuard],
    component: KubernetesAccessControlClusterRoleDetailComponent
  },
  {
    path: 'cluster-role-bindings',
    canActivate: [KubernetesClusterGuard],
    component: KubernetesAccessControlClusterRoleBindingListComponent
  },
  {
    path: 'cluster-role-bindings/detail',
    canActivate: [KubernetesClusterGuard],
    component: KubernetesAccessControlClusterRoleBindingDetailComponent
  },
  {
    path: 'persistent-volume-claims',
    canActivate: [KubernetesClusterGuard],
    component: KubernetesStoragePersistentVolumeClaimListComponent
  },
  {
    path: 'persistent-volume-claims/detail',
    canActivate: [KubernetesClusterGuard],
    component: KubernetesStoragePersistentVolumeClaimDetailComponent
  },
  {
    path: 'persistent-volumes',
    canActivate: [KubernetesClusterGuard],
    component: KubernetesStoragePersistentVolumeListComponent
  },
  {
    path: 'persistent-volumes/detail',
    canActivate: [KubernetesClusterGuard],
    component: KubernetesStoragePersistentVolumeDetailComponent
  },
  {
    path: 'storage-classes',
    canActivate: [KubernetesClusterGuard],
    component: KubernetesStorageStorageClassListComponent
  },
  {
    path: 'storage-classes/detail',
    canActivate: [KubernetesClusterGuard],
    component: KubernetesStorageStorageClassDetailComponent
  },
  {
    path: 'secrets',
    canActivate: [KubernetesClusterGuard],
    component: KubernetesConfigSecretListComponent
  },
  {
    path: 'secrets/detail',
    canActivate: [KubernetesClusterGuard],
    component: KubernetesConfigSecretDetailComponent
  },
  {
    path: 'limit-ranges',
    canActivate: [KubernetesClusterGuard],
    component: KubernetesConfigLimitRangeListComponent
  },
  {
    path: 'limit-ranges/detail',
    canActivate: [KubernetesClusterGuard],
    component: KubernetesConfigLimitRangeDetailComponent
  },
  {
    path: 'nodes',
    canActivate: [KubernetesClusterGuard],
    component: KubernetesNodeListComponent
  },
  {
    path: 'nodes/detail',
    canActivate: [KubernetesClusterGuard],
    component: KubernetesNodeDetailComponent
  },
  {
    path: 'overview',
    canActivate: [KubernetesClusterGuard],
    component: KubernetesWorkloadOverviewComponent
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class KubernetesRoutingModule { }
