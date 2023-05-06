import {Component, OnInit} from "@angular/core";
import {HeaderService} from "../../../../../components/header/header.service";
import {KubernetesSupportList} from "../../../support/kubernetes.support.list";
import {Header} from "../../../../../components/header/header";
import {KubernetesWorkloadDaemonSetList} from "../kubernetes.workload.daemon-set.list";
import {KubernetesWorkloadDaemonSetService} from "../kubernetes.workload.daemon-set.service";

@Component({
  selector: 'app-kubernetes-workload-daemon-set-list',
  templateUrl: './kubernetes.workload.daemon-set.list.component.html'
})
export class KubernetesWorkloadDaemonSetListComponent extends KubernetesSupportList<KubernetesWorkloadDaemonSetList> implements OnInit {

  constructor(private daemonSetService: KubernetesWorkloadDaemonSetService,
              headerService: HeaderService) {
    super(headerService, daemonSetService);
  }

  getHeader(): Header {
    return {
      name: 'DaemonSet list',
      breadcrumbs: [
        {
          label: 'DaemonSets',
          link: '/kubernetes/daemon-sets'
        }
      ]
    };
  }

}
