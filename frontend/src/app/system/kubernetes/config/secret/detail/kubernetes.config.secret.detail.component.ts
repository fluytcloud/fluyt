import {Component} from "@angular/core";
import {HeaderService} from "../../../../../components/header/header.service";
import {ActivatedRoute} from "@angular/router";
import {KubernetesSupportNamespaceObjectFilter} from "../../../support/kubernetes.support.namespace.object.filter";
import {KubernetesSupportDetail} from "../../../support/kubernetes.support.detail";
import {Header} from "../../../../../components/header/header";
import {KubernetesConfigSecretList} from "../kubernetes.config.secret.list";
import {KubernetesConfigSecretService} from "../kubernetes.config.secret.service";

@Component({
  selector: 'app-kubernetes-config-secret-detail',
  templateUrl: './kubernetes.config.secret.detail.component.html',
  styleUrls: ['./kubernetes.config.secret.detail.component.scss']
})
export class KubernetesConfigSecretDetailComponent extends KubernetesSupportDetail<KubernetesConfigSecretList> {

  codeMirrorConfig = {
    readOnly: true,
    lineNumbers: true,
    theme: 'material'
  };

  constructor(headerService: HeaderService,
              activatedRoute: ActivatedRoute,
              private secretService: KubernetesConfigSecretService) {
    super(headerService, activatedRoute, secretService);
  }

  getHeader(filter: KubernetesSupportNamespaceObjectFilter): Header {
    return {
      name: `Secret ${filter.name} details`,
      breadcrumbs: [
        {
          label: 'Secrets',
          link: '/kubernetes/secrets'
        },
        {
          label: 'Detail',
          link: `/kubernetes/secrets/detail?name=${filter.name}&namespace=${filter.namespace}&cluster=${filter.clusterId}`
        }
      ]
    };
  }

}
