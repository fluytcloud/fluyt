import {Component} from "@angular/core";
import {OptionDropdown} from "../../../../components/dropdown/option/option.dropdown";
import {ActivatedRoute} from "@angular/router";
import {FormBuilder, Validators} from "@angular/forms";
import {HeaderService} from "../../../../components/header/header.service";
import {KubernetesClusterService} from "../kubernetes.cluster.service";
import {MessageService} from "primeng/api";
import {Location} from "@angular/common";
import {KubernetesClusterConnectionType} from "../kubernetes.cluster.connection.type";
import {CrudForm} from "../../../../support/crud.form";
import {KubernetesCluster} from "../kubernetes.cluster";
import {KubernetesClusterList} from "../kubernetes.cluster.list";
import {Header} from "../../../../components/header/header";

@Component({
  selector: 'app-kubernetes-cluster-form',
  templateUrl: './kubernetes.cluster.form.component.html'
})
export class KubernetesClusterFormComponent extends CrudForm<KubernetesCluster, KubernetesClusterList> {

  types: OptionDropdown[] = [];

  constructor(private readonly kubernetesClusterService: KubernetesClusterService,
              activatedRoute: ActivatedRoute,
              formBuilder: FormBuilder,
              headerService: HeaderService,
              messageService: MessageService,
              location: Location) {
    super(formBuilder, activatedRoute, headerService, messageService, location, kubernetesClusterService, {
      id: [null],
      connectionType: [null, [Validators.required]],
      name: [null, [Validators.required]],
      url: [null],
      token: [null],
      username: [null],
      password: [null],
      validateSSL: [null]
    });

    this.getFormControl('connectionType')?.valueChanges.subscribe({
      next: type => {
        this.clearValidatorsOnFields(['url', 'token', 'username', 'password']);
        if (KubernetesClusterConnectionType.TOKEN === type) {
          this.addValidator('url', Validators.required);
          this.addValidator('token', Validators.required);
        } else if (KubernetesClusterConnectionType.BASIC === type) {
          this.addValidator('url', Validators.required);
          this.addValidator('username', Validators.required);
          this.addValidator('password', Validators.required);
        }
      }
    });

    Object.values(KubernetesClusterConnectionType).forEach(it => {
      this.types.push({
        value: it,
        label: it
      })
    });
  }

  override reset() {
    super.reset();
    this.form.get('connectionType')?.setValue(KubernetesClusterConnectionType.DEFAULT);
  }

  getHeader(): Header {
    return {
      name: 'Cluster form',
      breadcrumbs: [
        {
          label: 'Cluster list',
          link: '/kubernetes/cluster'
        },
        {
          label: 'form',
          link: '/kubernetes/cluster/form'
        }
      ]
    };
  }

  public get connectionType(): typeof KubernetesClusterConnectionType {
    return KubernetesClusterConnectionType;
  }

  override preSave() {
    if (KubernetesClusterConnectionType.DEFAULT === this.getValue('connectionType')) {
      this.form.get('url')?.setValue(null);
      this.form.get('token')?.setValue(null);
      this.form.get('username')?.setValue(null);
      this.form.get('password')?.setValue(null);
    } else if (KubernetesClusterConnectionType.TOKEN === this.getValue('connectionType')) {
      this.form.get('username')?.setValue(null);
      this.form.get('password')?.setValue(null);
    } else if (KubernetesClusterConnectionType.BASIC === this.getValue('connectionType')) {
      this.form.get('token')?.setValue(null);
    }
  }

}
