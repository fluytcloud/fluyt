import {Component, EventEmitter, Input, OnInit, Output} from "@angular/core";
import {KubernetesSearch} from "./kubernetes.search";
import {ActivatedRoute} from "@angular/router";

@Component({
  selector: 'app-kubernetes-search',
  templateUrl: './kubernetes.search.component.html'
})
export class KubernetesSearchComponent implements OnInit {

  @Input() showNamespace: boolean = true;
  @Output() filter = new EventEmitter<KubernetesSearch>;

  search?: KubernetesSearch;
  namespaces?: string[];

  constructor(private activatedRoute: ActivatedRoute) {
  }

  ngOnInit(): void {
    const clusterId = this.activatedRoute.snapshot.queryParams['cluster']!;
    this.search = new KubernetesSearch(clusterId);

    // todo Gaspar - get namespace by rest
    this.namespaces = ['default', 'kube-system'];

    this.filter.emit(this.search);
  }

}
