import {NgModule} from "@angular/core";
import {KubernetesComponentsListModule} from "../../components/list/kubernetes.components.list.module";
import {MatMenuModule} from "@angular/material/menu";
import {MatButtonModule} from "@angular/material/button";
import {MatIconModule} from "@angular/material/icon";
import {RouterModule} from "@angular/router";
import {LoaderModule} from "../../../../components/loader/loader.module";
import {MatExpansionModule} from "@angular/material/expansion";
import {FormContainerModule} from "../../../../components/form/container/form.container.module";
import {
  FormMultipleContainerModule
} from "../../../../components/form/multiple-container/form.multiple-container.module";
import {CommonModule, DatePipe, KeyValuePipe} from "@angular/common";
import {MatChipsModule} from "@angular/material/chips";
import {TableModule} from "primeng/table";
import {KubernetesNetworkIngressService} from "./kubernetes.network.ingress.service";
import {KubernetesNetworkIngressListComponent} from "./list/kubernetes.network.ingress.list.component";
import {KubernetesNetworkIngressDetailComponent} from "./detail/kubernetes.network.ingress.detail.component";
import {
  KubernetesNetworkIngressDetailLoadBalancerComponent
} from "./detail/load-balancer/kubernetes.network.ingress.detail.load-balancer.component";
import {
  KubernetesNetworkIngressDetailRuleComponent
} from "./detail/rule/kubernetes.network.ingress.detail.rule.component";
import {MatDividerModule} from "@angular/material/divider";
import {KubernetesComponentsActionsModule} from "../../components/action/kubernetes.components.actions.module";

@NgModule({
  declarations: [
    KubernetesNetworkIngressListComponent,
    KubernetesNetworkIngressDetailComponent,
    KubernetesNetworkIngressDetailLoadBalancerComponent,
    KubernetesNetworkIngressDetailRuleComponent
  ],
  exports: [
    KubernetesNetworkIngressListComponent,
    KubernetesNetworkIngressDetailComponent,
    KubernetesNetworkIngressDetailLoadBalancerComponent,
    KubernetesNetworkIngressDetailRuleComponent
  ],
    imports: [
        CommonModule,
        KubernetesComponentsListModule,
        MatMenuModule,
        MatButtonModule,
        MatIconModule,
        RouterModule,
        LoaderModule,
        MatExpansionModule,
        FormContainerModule,
        FormMultipleContainerModule,
        DatePipe,
        MatChipsModule,
        KeyValuePipe,
        TableModule,
        MatDividerModule,
        KubernetesComponentsActionsModule
    ],
  providers: [
    KubernetesNetworkIngressService
  ]
})
export class KubernetesNetworkIngressModule {

}
