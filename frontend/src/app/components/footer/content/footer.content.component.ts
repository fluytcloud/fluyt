import {Component, ComponentFactoryResolver, Input, OnInit, Type, ViewChild} from "@angular/core";
import {FooterDirective} from "../footer.directive";

@Component({
  selector: 'app-footer-content',
  templateUrl: './footer.content.component.html',
  styleUrls: ['./footer.content.component.scss']
})
export class FooterContentComponent implements OnInit {

  @Input() type!: Type<any>;

  @Input() data: any;

  @ViewChild(FooterDirective, {static: true}) footerHost?: FooterDirective;

  constructor(private componentFactoryResolver: ComponentFactoryResolver) {
  }

  ngOnInit(): void {
    const componentFactory = this.componentFactoryResolver.resolveComponentFactory(this.type);
    const viewContainerRef = this.footerHost?.viewContainerRef;
    viewContainerRef?.clear();

    const componentRef = viewContainerRef?.createComponent(componentFactory);
    for (const key in this.data) {
      componentRef!.instance[key] = this.data[key];
    }
  }

}
