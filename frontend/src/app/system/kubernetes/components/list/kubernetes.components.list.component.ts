import {Component, ContentChild, EventEmitter, Input, Output, TemplateRef} from "@angular/core";
import {KubernetesSearch} from "../../search/kubernetes.search";
import {KubernetesWorkloadPodList} from "../../workload/pod/kubernetes.workload.pod.list";

@Component({
  selector: 'app-kubernetes-components-list',
  templateUrl: './kubernetes.components.list.component.html'
})
export class KubernetesComponentsListComponent {

  @Input() name!: string;
  @Output() filter = new EventEmitter<KubernetesSearch>;
  @Input() values: any[] = [];
  @Input() loading = true;
  @Input() showNamespace = true;
  @ContentChild('header') header!: TemplateRef<any>;
  @ContentChild('body') body!: TemplateRef<any>;

  load($event: KubernetesSearch): void {
    this.filter.emit($event);
  }
}
