import {NgModule} from "@angular/core";
import {CommonModule} from "@angular/common";
import {KubernetesRoutingModule} from "./kubernetes-routing.module";
import {KubernetesHomeComponent} from "./home/kubernetes.home.component";
import {KubernetesClusterService} from "./cluster/kubernetes.cluster.service";
import {MatButtonModule} from "@angular/material/button";
import {TableModule} from "primeng/table";
import {MatIconModule} from "@angular/material/icon";
import {FormContainerModule} from "../../components/form/container/form.container.module";
import {LoaderModule} from "../../components/loader/loader.module";
import {FormsModule} from "@angular/forms";
import {KubernetesWorkloadPodModule} from "./workload/pod/kubernetes.workload.pod.module";
import {CrudListModule} from "../../components/crud/list/crud.list.module";
import {KubernetesTerminalModule} from "./terminal/kubernetes.terminal.module";
import {KubernetesClusterGuard} from "./guard/kubernetes.cluster.guard";
import {KubernetesCatalogModule} from "./catalog/kubernetes.catalog.module";
import {KubernetesClusterModule} from "./cluster/kubernetes.cluster.module";
import {MatMenuModule} from "@angular/material/menu";
import {KubernetesConfigConfigMapModule} from "./config/config-map/kubernetes.config.config-map.module";
import {KubernetesWorkloadReplicaSetModule} from "./workload/replica-set/kubernetes.workload.replica-set.module";
import {KubernetesWorkloadStatefulSetModule} from "./workload/stateful-set/kubernetes.workload.stateful-set.module";
import {KubernetesWorkloadDaemonSetModule} from "./workload/daemon-set/kubernetes.workload.daemon-set.module";
import {KubernetesWorkloadCronJobModule} from "./workload/cron-job/kubernetes.workload.cron-job.module";
import {KubernetesWorkloadJobModule} from "./workload/job/kubernetes.workload.job.module";
import {KubernetesNetworkEndpointModule} from "./network/endpoint/kubernetes.network.endpoint.module";
import {
  KubernetesConfigHorizontalPodAutoscalerModule
} from "./config/horizontal-pod-autoscaler/kubernetes.config.horizontal-pod-autoscaler.module";
import {KubernetesNetworkIngressModule} from "./network/ingress/kubernetes.network.ingress.module";
import {KubernetesNetworkServiceModule} from "./network/service/kubernetes.network.service.module";
import {KubernetesWorkloadDeploymentModule} from "./workload/deployment/kubernetes.workload.deployment.module";
import {
  KubernetesAccessControlRoleBindingModule
} from "./access-control/role-binding/kubernetes.access-control.role-binding.module";
import {
  KubernetesAccessControlServiceAccountModule
} from "./access-control/service-account/kubernetes.access-control.service-account.module";
import {KubernetesAccessControlRoleModule} from "./access-control/role/kubernetes.access-control.role.module";
import {KubernetesConfigResourceQuotaModule} from "./config/resource-quota/kubernetes.config.resource-quota.module";
import {
  KubernetesAccessControlClusterRoleModule
} from "./access-control/cluster-role/kubernetes.access-control.cluster-role.module";
import {
  KubernetesAccessControlClusterRoleBindingModule
} from "./access-control/cluster-role-binding/kubernetes.access-control.cluster-role-binding.module";
import {
  KubernetesStoragePersistentVolumeClaimModule
} from "./storage/persistent-volume-claim/kubernetes.storage.persistent-volume-claim.module";
import {
  KubernetesStoragePersistentVolumeModule
} from "./storage/persistent-volume/kubernetes.storage.persistent-volume.module";
import {KubernetesStorageStorageClassModule} from "./storage/storage-class/kubernetes.storage.storage-class.module";
import {KubernetesConfigSecretModule} from "./config/secret/kubernetes.config.secret.module";
import {KubernetesConfigLimitRangeModule} from "./config/limit-range/kubernetes.config.limit-range.module";
import {KubernetesNodeModule} from "./node/kubernetes.node.module";
import {KubernetesEditorModule} from "./editor/kubernetes-editor.module";
import {KubernetesWorkloadOverviewModule} from "./workload/overview/kubernetes.workload.overview.module";

@NgModule({
  declarations: [
    KubernetesHomeComponent
  ],
  exports: [
    KubernetesHomeComponent
  ],
  imports: [
    CommonModule,
    MatButtonModule,
    TableModule,
    MatMenuModule,
    MatIconModule,
    FormContainerModule,
    LoaderModule,
    FormsModule,
    KubernetesWorkloadPodModule,
    CrudListModule,
    KubernetesCatalogModule,
    KubernetesClusterModule,
    KubernetesRoutingModule,
    KubernetesTerminalModule,
    KubernetesEditorModule,
    KubernetesConfigConfigMapModule,
    KubernetesWorkloadReplicaSetModule,
    KubernetesWorkloadStatefulSetModule,
    KubernetesWorkloadDaemonSetModule,
    KubernetesWorkloadCronJobModule,
    KubernetesWorkloadJobModule,
    KubernetesNetworkEndpointModule,
    KubernetesConfigHorizontalPodAutoscalerModule,
    KubernetesNetworkIngressModule,
    KubernetesNetworkServiceModule,
    KubernetesWorkloadJobModule,
    KubernetesWorkloadDeploymentModule,
    KubernetesAccessControlRoleBindingModule,
    KubernetesAccessControlServiceAccountModule,
    KubernetesAccessControlRoleModule,
    KubernetesNetworkEndpointModule,
    KubernetesConfigResourceQuotaModule,
    KubernetesAccessControlClusterRoleModule,
    KubernetesAccessControlClusterRoleBindingModule,
    KubernetesStoragePersistentVolumeClaimModule,
    KubernetesStoragePersistentVolumeModule,
    KubernetesStorageStorageClassModule,
    KubernetesConfigSecretModule,
    KubernetesConfigLimitRangeModule,
    KubernetesNodeModule,
    KubernetesWorkloadOverviewModule
  ],
  providers: [
    KubernetesClusterService,
    KubernetesClusterGuard
  ]
})
export class KubernetesModule {

}
