import {Injectable} from "@angular/core";
import {environment} from "../../../../../environments/environment";
import {HttpClient} from "@angular/common/http";
import {KubernetesSupportService} from "../../support/kubernetes.support.service";
import {KubernetesConfigHorizontalPodAutoscalerList} from "./kubernetes.config.horizontal-pod-autoscaler.list";

@Injectable()
export class KubernetesConfigHorizontalPodAutoscalerService extends KubernetesSupportService<KubernetesConfigHorizontalPodAutoscalerList> {

  constructor(http: HttpClient) {
    super(http);
  }

  getUrl(): string {
    return `${environment.system_v1}/kubernetes/horizontal-pod-autoscaler`;
  }

}
