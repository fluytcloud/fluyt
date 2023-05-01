import {Directive, ViewContainerRef} from "@angular/core";

@Directive({
  selector: '[footerHost]'
})
export class FooterDirective {

  constructor(public viewContainerRef: ViewContainerRef) {
  }

}
