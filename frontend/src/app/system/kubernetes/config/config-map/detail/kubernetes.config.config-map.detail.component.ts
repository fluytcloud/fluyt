import {Component, OnInit} from "@angular/core";
import {HeaderService} from "../../../../../components/header/header.service";
import {finalize} from "rxjs";
import {ActivatedRoute} from "@angular/router";
import {KubernetesSupportNamespaceObjectFilter} from "../../../support/kubernetes.support.namespace.object.filter";
import {KubernetesConfigConfigMapService} from "../kubernetes.config.config-map.service";

@Component({
  selector: 'app-kubernetes-config-config-map-detail',
  templateUrl: './kubernetes.config.config-map.detail.component.html',
  styleUrls: ['./kubernetes.config.config-map.detail.component.scss']
})
export class KubernetesConfigConfigMapDetailComponent implements OnInit {

  display = false;
  configMap: any;
  codeMirrorConfig = {
    readOnly: true,
    lineNumbers: true,
    theme: 'material'
  };

  constructor(private headerService: HeaderService,
              private activatedRoute: ActivatedRoute,
              private configMapService: KubernetesConfigConfigMapService) {
  }

  ngOnInit(): void {
    const clusterId = this.activatedRoute.snapshot.queryParams['cluster']!;
    const name = this.activatedRoute.snapshot.queryParams['name']!;
    const namespace = this.activatedRoute.snapshot.queryParams['namespace']!;

    this.headerService.notifyHeader({
      name: `ConfigMap ${name} details`,
      breadcrumbs: [
        {
          label: 'ConfigMaps',
          link: '/kubernetes/config-maps'
        },
        {
          label: 'Detail',
          link: `/kubernetes/config-maps/detail?name=${name}&namespace${namespace}&cluster${clusterId}`
        }
      ]
    });

    const filter = new KubernetesSupportNamespaceObjectFilter(clusterId, namespace, name);
    this.configMapService.get(filter)
      .pipe(finalize(() => this.display = true))
      .subscribe(configMap => {
        this.configMap = configMap;
      });
  }

}
