import {Component} from "@angular/core";
import {KubernetesSupportDetail} from "../../support/kubernetes.support.detail";
import {HeaderService} from "../../../../components/header/header.service";
import {ActivatedRoute} from "@angular/router";
import {KubernetesEventService} from "../kubernetes.event.service";
import {KubernetesSupportNamespaceObjectFilter} from "../../support/kubernetes.support.namespace.object.filter";
import {Header} from "../../../../components/header/header";
import {KubernetesEventList} from "../kubernetes.event.list";

@Component({
  selector: 'app-kubernetes-event-detail',
  templateUrl: './kubernetes.event.detail.component.html'
})
export class KubernetesEventDetailComponent extends KubernetesSupportDetail<KubernetesEventList> {

  constructor(headerService: HeaderService,
              activatedRoute: ActivatedRoute,
              private eventService: KubernetesEventService) {
    super(headerService, activatedRoute, eventService);
  }

  getHeader(filter: KubernetesSupportNamespaceObjectFilter): Header {
    return {
      name: `Event ${filter.name} details`,
      breadcrumbs: [
        {
          label: 'Events',
          link: '/kubernetes/events'
        },
        {
          label: 'Detail',
          link: `/kubernetes/events/detail?name=${filter.name}&namespace${filter.namespace}&cluster${filter.clusterId}`
        }
      ]
    };
  }

}
