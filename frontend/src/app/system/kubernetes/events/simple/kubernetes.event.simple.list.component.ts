import {Component, Input, OnInit} from "@angular/core";
import {KubernetesSupportSimpleList} from "../../support/kubernetes.support.simple.list";
import {KubernetesEventSimpleList} from "./kubernetes.event.simple.list";
import {KubernetesSearch} from "../../search/kubernetes.search";
import {KubernetesEventService} from "../kubernetes.event.service";

@Component({
  selector: 'app-kubernetes-events-simple-list',
  templateUrl: './kubernetes.event.simple.list.component.html'
})
export class KubernetesEventSimpleListComponent extends KubernetesSupportSimpleList<KubernetesEventSimpleList> implements OnInit {
  constructor(private eventService: KubernetesEventService) {
    super(eventService);
  }

  ngOnInit() {
    super.load();
  }

}
