import {Component} from "@angular/core";
import {KubernetesClusterList} from "../kubernetes.cluster.list";
import {HeaderService} from "../../../../components/header/header.service";
import {ConfirmationService, MessageService} from "primeng/api";
import {KubernetesClusterService} from "../kubernetes.cluster.service";
import {CrudList} from "../../../../support/crud.list";
import {Router} from "@angular/router";
import {Header} from "../../../../components/header/header";
import {KubernetesCluster} from "../kubernetes.cluster";

@Component({
  selector: 'app-kubernetes-cluster-list',
  templateUrl: './kubernetes.cluster.list.component.html'
})
export class KubernetesClusterListComponent extends CrudList<KubernetesCluster, KubernetesClusterList> {

  constructor(private readonly kubernetesClusterService: KubernetesClusterService,
              router: Router,
              headerService: HeaderService,
              messageService: MessageService,
              confirmationService: ConfirmationService) {
    super(headerService, router, messageService, confirmationService, kubernetesClusterService);
  }

  getHeader(): Header {
    return {
      name: 'Cluster list',
      breadcrumbs: [
        {
          label: 'Cluster list',
          link: '/kubernetes/cluster'
        }
      ]
    };
  }

}
