import {Component, OnInit} from "@angular/core";
import {HeaderService} from "../../../../../components/header/header.service";
import {finalize} from "rxjs";
import {ActivatedRoute} from "@angular/router";
import {
  KubernetesSupportNamespaceObjectFilterList
} from "../../../support/kubernetes.support.namespace.object.filter.list";
import {KubernetesConfigConfigMapList} from "../kubernetes.config.config-map.list";
import {KubernetesConfigConfigMapService} from "../kubernetes.config.config-map.service";

@Component({
  selector: 'app-kubernetes-config-config-map-list',
  templateUrl: './kubernetes.config.config-map.list.component.html'
})
export class KubernetesConfigConfigMapListComponent implements OnInit {

  configMaps: KubernetesConfigConfigMapList[] = [];
  loading = true;
  clusterId!: number;

  constructor(private configConfigMapService: KubernetesConfigConfigMapService,
              private activatedRoute: ActivatedRoute,
              private headerService: HeaderService) {
  }

  ngOnInit(): void {
    this.clusterId = this.activatedRoute.snapshot.queryParams['cluster']!;

    this.headerService.notifyHeader({
      name: 'ConfigMap list',
      breadcrumbs: [
        {
          label: 'ConfigMaps',
          link: '/kubernetes/config-maps'
        }
      ]
    });

    const filter = new KubernetesSupportNamespaceObjectFilterList(this.clusterId);
    this.configConfigMapService.find(filter)
      .pipe(finalize(() => this.loading = false))
      .subscribe(configMaps => {
        this.configMaps = configMaps;
      });
  }

}
