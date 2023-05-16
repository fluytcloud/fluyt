import {Directive, OnInit} from "@angular/core";
import {HeaderService} from "../../../components/header/header.service";
import {ActivatedRoute} from "@angular/router";
import {KubernetesSupportNamespaceObjectFilter} from "./kubernetes.support.namespace.object.filter";
import {finalize} from "rxjs";
import {KubernetesSupportService} from "./kubernetes.support.service";
import {Header} from "../../../components/header/header";
import {KubernetesSearch} from "../search/kubernetes.search";

@Directive()
export abstract class KubernetesSupportDetail<T> implements OnInit {

  display = false;
  value: any;
  filterSimpleList?: KubernetesSearch;
  owners?: string[];

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
        this.getFilterToSimpleList(clusterId, namespace, name, this.value?.spec?.selector?.matchLabels, this.value?.metadata?.uid);
      });
  }

  abstract getHeader(filter: KubernetesSupportNamespaceObjectFilter): Header;

  getFilterToSimpleList(clusterId: number, namespace: string, name: string, selector: string, owner: string) {
    const search = new KubernetesSearch(clusterId);
    search.name = name;
    search.namespaces = [namespace];
    if (selector) {
      search.labelSelector = JSON.stringify(selector);
    }

    search.owner = [owner];
    this.filterSimpleList = search;
  }

  addOwners(owners: string[]): void {
    if (owners.length > 0) {
      this.owners = owners;
      for (const owner of this.owners) {
        this.filterSimpleList!.owner?.push(owner);
      }
    }
  }
}
