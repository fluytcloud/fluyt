import {NgModule} from "@angular/core";
import {KubernetesWorkloadPodService} from "./kubernetes.workload.pod.service";
import {CommonModule} from "@angular/common";
import {KubernetesWorkloadPodListComponent} from "./list/kubernetes.workload.pod.list.component";
import {TableModule} from "primeng/table";
import {MatButtonModule} from "@angular/material/button";
import {MatIconModule} from "@angular/material/icon";
import {MatMenuModule} from "@angular/material/menu";
import {PipesPodSeverityModule} from "../../pipes/pod/severity/pipes.pod.severity.module";
import {KubernetesWorkloadPodDetailComponent} from "./detail/kubernetes.workload.pod.detail.component";
import {FormContainerModule} from "../../../../components/form/container/form.container.module";
import {RouterModule} from "@angular/router";
import {LoaderModule} from "../../../../components/loader/loader.module";
import {
  FormMultipleContainerModule
} from "../../../../components/form/multiple-container/form.multiple-container.module";
import {PipesPodContainerPortModule} from "../../pipes/pod/container/port/pipes.pod.container.port.module";
import {PipesPodContainerEnvModule} from "../../pipes/pod/container/env/pipes.pod.container.env.module";
import {PipesPodContainerMountModule} from "../../pipes/pod/container/mount/pipes.pod.container.mount.module";
import {PipesPodVolumeKindModule} from "../../pipes/pod/volume/kind/pipes.pod.volume.kind.module";
import {
  KubernetesWorkloadPodDetailContainerComponent
} from "./detail/container/kubernetes.workload.pod.detail.container.component";
import {
  KubernetesWorkloadPodDetailVolumeComponent
} from "./detail/volume/kubernetes.workload.pod.detail.volume.component";
import {MatChipsModule} from "@angular/material/chips";
import {MatExpansionModule} from "@angular/material/expansion";
import {MatCardModule} from "@angular/material/card";
import {MatDividerModule} from "@angular/material/divider";
import {FormsModule} from "@angular/forms";
import {KubernetesComponentsListModule} from "../../components/list/kubernetes.components.list.module";
import {KubernetesWorkloadPodSimpleListComponent} from "./simple/kubernetes.workload.pod.simple.list.component";
import {
  KubernetesComponentsSimpleListModule
} from "../../components/list/simple/kubernetes.components.simple.list.module";
import {KubernetesComponentsActionsModule} from "../../components/action/kubernetes.components.actions.module";

@NgModule({
  declarations: [
    KubernetesWorkloadPodListComponent,
    KubernetesWorkloadPodDetailComponent,
    KubernetesWorkloadPodDetailContainerComponent,
    KubernetesWorkloadPodDetailVolumeComponent,
    KubernetesWorkloadPodSimpleListComponent
  ],
  exports: [
    KubernetesWorkloadPodListComponent,
    KubernetesWorkloadPodDetailComponent,
    KubernetesWorkloadPodDetailContainerComponent,
    KubernetesWorkloadPodDetailVolumeComponent,
    KubernetesWorkloadPodSimpleListComponent
  ],
    imports: [
        CommonModule,
        FormsModule,
        TableModule,
        MatButtonModule,
        MatIconModule,
        MatMenuModule,
        PipesPodSeverityModule,
        FormContainerModule,
        RouterModule,
        LoaderModule,
        FormMultipleContainerModule,
        PipesPodContainerPortModule,
        PipesPodContainerEnvModule,
        PipesPodContainerMountModule,
        PipesPodVolumeKindModule,
        MatChipsModule,
        MatExpansionModule,
        MatCardModule,
        MatDividerModule,
        KubernetesComponentsListModule,
        KubernetesComponentsSimpleListModule,
        KubernetesComponentsActionsModule
    ],
  providers: [
    KubernetesWorkloadPodService
  ]
})
export class KubernetesWorkloadPodModule {

}
