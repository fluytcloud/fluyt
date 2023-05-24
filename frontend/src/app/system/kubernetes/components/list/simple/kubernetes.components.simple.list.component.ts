import {Component, ContentChild, EventEmitter, Input, OnInit, Output, TemplateRef} from "@angular/core";
import {KubernetesSearch} from "../../../search/kubernetes.search";

@Component({
  selector: 'app-kubernetes-components-simple-list',
  templateUrl: './kubernetes.components.simple.list.component.html'
})
export class KubernetesComponentsSimpleListComponent implements OnInit {

  @Input() name!: string;
  @Output() load = new EventEmitter<KubernetesSearch>;
  @Input() values: any[] = [];
  @Input() loading = true;
  @ContentChild('header') header!: TemplateRef<any>;
  @ContentChild('body') body!: TemplateRef<any>;

  ngOnInit() {
    this.load.emit();
  }

}
