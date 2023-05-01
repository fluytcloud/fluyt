import {Page} from "./page";
import {LazyLoadEvent} from "primeng/api";
import {PageLazyService} from "./page.lazy.service";
import {finalize} from "rxjs";

export abstract class PageLazy<T> {

  page?: Page<T>;
  loading: boolean = false;
  rows: number = Math.floor((window.innerHeight - 200) / 55);

  constructor() {
    setTimeout(() => {
      this.init();
    });
  }

  init(): void {
    this.load({
      first: 0,
      rows: this.rows
    });
  }

  load(event: LazyLoadEvent): void {
    this.loading = true;

    const pageSize = event.rows!;
    const pageNumber = event.first! / pageSize;

    this.pageLazyService().findAll(pageNumber, pageSize)
      .pipe(finalize(() => this.loading = false))
      .subscribe({
        next: page => this.page = page,
        error: error => console.log(error)
      });
  }

  abstract pageLazyService(): PageLazyService<T>;

}
