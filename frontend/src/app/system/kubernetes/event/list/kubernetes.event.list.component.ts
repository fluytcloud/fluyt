import {Component, OnInit} from "@angular/core";
import {KubernetesEventList} from "../kubernetes.event.list";
import {KubernetesEventService} from "../kubernetes.event.service";
import {KubernetesSupportList} from "../../support/kubernetes.support.list";
import {HeaderService} from "../../../../components/header/header.service";
import {Header} from "../../../../components/header/header";

@Component({
  selector: 'app-kubernetes-event-list',
  templateUrl: './kubernetes.event.list.component.html'
})
export class KubernetesEventListComponent extends KubernetesSupportList<KubernetesEventList> {

  constructor(private eventService: KubernetesEventService,
              headerService: HeaderService) {
    super(headerService, eventService);
  }

  getHeader(): Header {
    return {
      name: 'Event list',
      breadcrumbs: [
        {
          label: 'Events',
          link: '/kubernetes/events'
        }
      ]
    };
  }

}
