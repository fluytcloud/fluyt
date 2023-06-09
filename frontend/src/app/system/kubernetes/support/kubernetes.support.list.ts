import {KubernetesSupportService} from "./kubernetes.support.service";
import {HeaderService} from "../../../components/header/header.service";
import {Header} from "../../../components/header/header";
import {KubernetesSearch} from "../search/kubernetes.search";
import {finalize} from "rxjs";
import {Directive, OnInit} from "@angular/core";


@Directive()
export abstract class KubernetesSupportList<T> implements OnInit {

  loading = true;
  values: T[] = [];

  protected constructor(public headerService: HeaderService,
                        public crudService: KubernetesSupportService<T>) {
  }

  ngOnInit(): void {
    this.headerService.notifyHeader(this.getHeader());
  }

  abstract getHeader(): Header;

  load(search: KubernetesSearch): void {
    this.crudService.find(search)
      .pipe(finalize(() => this.loading = false))
      .subscribe(values => {
        this.values = values;
      });
  }

}
