import {Component} from "@angular/core";
import {HeaderService} from "../../../../../components/header/header.service";
import {KubernetesSupportList} from "../../../support/kubernetes.support.list";
import {Header} from "../../../../../components/header/header";
import {KubernetesConfigSecretList} from "../kubernetes.config.secret.list";
import {KubernetesConfigSecretService} from "../kubernetes.config.secret.service";

@Component({
  selector: 'app-kubernetes-config-secret-list',
  templateUrl: './kubernetes.config.secret.list.component.html'
})
export class KubernetesConfigSecretListComponent extends KubernetesSupportList<KubernetesConfigSecretList> {

  constructor(private secretService: KubernetesConfigSecretService,
              headerService: HeaderService) {
    super(headerService, secretService);
  }

  getHeader(): Header {
    return {
      name: 'Secret list',
      breadcrumbs: [
        {
          label: 'Secrets',
          link: '/kubernetes/secrets'
        }
      ]
    };
  }

}
