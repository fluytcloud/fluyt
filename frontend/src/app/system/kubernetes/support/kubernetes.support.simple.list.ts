import {Directive, EventEmitter, Input, Output} from "@angular/core";
import {KubernetesSupportService} from "./kubernetes.support.service";
import {KubernetesSearch} from "../search/kubernetes.search";
import {finalize} from "rxjs";

@Directive()
export abstract class KubernetesSupportSimpleList<T> {

  loading = true;
  values: T[] = [];

  @Input() filter!: KubernetesSearch;
  @Output() uidsEmitter = new EventEmitter<string[]>;

  protected constructor(public crudService: KubernetesSupportService<any>) {}

  load(): void {
    this.crudService.findSimple(this.filter)
      .pipe(finalize(() => this.loading = false))
      .subscribe(values => {
        this.values = values;
        if (this.values) {
          const uids = this.values.map((it: any) => it.uid);
          this.uidsEmitter.emit(uids);
        }
      });
  }
}
