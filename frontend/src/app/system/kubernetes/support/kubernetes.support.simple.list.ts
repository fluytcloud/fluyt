import {Directive, Input} from "@angular/core";
import {KubernetesSupportService} from "./kubernetes.support.service";
import {KubernetesSearch} from "../search/kubernetes.search";
import {filter, finalize} from "rxjs";

@Directive()
export abstract class KubernetesSupportSimpleList<T> {

  loading = true;
  values: T[] = [];

  protected constructor(public crudService: KubernetesSupportService<any>) {}

  abstract getFilter(): KubernetesSearch;

  load(): void {
    this.crudService.findSimple(this.getFilter())
      .pipe(finalize(() => this.loading = false))
      .subscribe(values => {
        this.values = values;
      });
  }
}
