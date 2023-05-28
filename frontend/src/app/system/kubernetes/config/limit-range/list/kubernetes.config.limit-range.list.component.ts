import {Component, OnInit} from "@angular/core";
import {HeaderService} from "../../../../../components/header/header.service";
import {KubernetesSupportList} from "../../../support/kubernetes.support.list";
import {Header} from "../../../../../components/header/header";
import {KubernetesConfigLimitRangeService} from "../kubernetes.config.limit-range.service";
import {KubernetesConfigLimitRangeList} from "../kubernetes.config.limit-range.list";

@Component({
  selector: 'app-kubernetes-config-limit-range-list',
  templateUrl: './kubernetes.config.limit-range.list.component.html'
})
export class KubernetesConfigLimitRangeListComponent extends KubernetesSupportList<KubernetesConfigLimitRangeList> implements OnInit {

  constructor(private limitRangeService: KubernetesConfigLimitRangeService,
              headerService: HeaderService) {
    super(headerService, limitRangeService);
  }

  getHeader(): Header {
    return {
      name: 'LimitRange list',
      breadcrumbs: [
        {
          label: 'LimitRanges',
          link: '/kubernetes/limit-ranges'
        }
      ]
    };
  }

}
