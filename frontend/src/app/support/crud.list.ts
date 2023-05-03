import {PageLazy} from "./page.lazy";
import {HeaderService} from "../components/header/header.service";
import {ConfirmationService, MessageService} from "primeng/api";
import {PageLazyService} from "./page.lazy.service";
import {Header} from "../components/header/header";
import {CrudService} from "./crud.service";
import {Router} from "@angular/router";
import {Directive, OnInit} from "@angular/core";

@Directive()
export abstract class CrudList<T, LIST> extends PageLazy<LIST> implements OnInit {

  protected constructor(public headerService: HeaderService,
                        public router: Router,
                        public messageService: MessageService,
                        public confirmationService: ConfirmationService,
                        public crudService: CrudService<T, LIST>) {
    super();
    console.log(router.url);
  }

  ngOnInit(): void {
    this.headerService.notifyHeader(this.getHeader());
  }

  abstract getHeader(): Header;

  override pageLazyService(): PageLazyService<LIST> {
    return this.crudService;
  }

  formUrl(): string {
    return this.router.url + "/form";
  }

  delete(id: any, message: string): void {
    this.confirmationService.confirm({
      header: "Confirmação",
      message: `Você tem certeza que deseja remover ${message}?`,
      rejectLabel: "Cancelar",
      acceptLabel: "Remover",
      closeOnEscape: false,
      accept: () => {
        this.crudService.delete(id).subscribe({
          next: () => {
            this.messageService.add({
              severity: 'info',
              summary: 'Sucesso',
              detail: `${message} foi removida com sucesso`
            });
            this.init();
          },
          error: error => {
            this.messageService.add({
              severity: 'error',
              summary: 'Erro',
              detail: error?.error.message
            });
          }
        });
      }
    });
  }

}
