import {Directive, OnInit} from "@angular/core";
import {HeaderService} from "../../../components/header/header.service";
import {ActivatedRoute} from "@angular/router";
import {KubernetesSupportNamespaceObjectFilter} from "./kubernetes.support.namespace.object.filter";
import {finalize} from "rxjs";
import {KubernetesSupportService} from "./kubernetes.support.service";
import {Header} from "../../../components/header/header";

@Directive()
export abstract class KubernetesSupportDetail<T> implements OnInit {

  display = false;
  value: any;

  constructor(public headerService: HeaderService,
              public activatedRoute: ActivatedRoute,
              public crudService: KubernetesSupportService<T>) {
  }

  ngOnInit(): void {
    const clusterId = this.activatedRoute.snapshot.queryParams['cluster']!;
    const name = this.activatedRoute.snapshot.queryParams['name']!;
    const namespace = this.activatedRoute.snapshot.queryParams['namespace']!;
    const filter = new KubernetesSupportNamespaceObjectFilter(clusterId, namespace, name);

    const header = this.getHeader(filter);
    this.headerService.notifyHeader(header);

    this.crudService.get(filter)
      .pipe(finalize(() => this.display = true))
      .subscribe(value => {
        this.value = value;
      });
  }

  abstract getHeader(filter: KubernetesSupportNamespaceObjectFilter): Header;



}
