import {NgModule} from "@angular/core";
import {FooterComponent} from "./footer.component";
import {FooterDirective} from "./footer.directive";
import {FooterContentComponent} from "./content/footer.content.component";
import {NgForOf} from "@angular/common";
import {MatLegacyTabsModule as MatTabsModule} from "@angular/material/legacy-tabs";
import {KubernetesTerminalModule} from "../../system/kubernetes/terminal/kubernetes.terminal.module";

@NgModule({
  declarations: [
    FooterComponent,
    FooterDirective,
    FooterContentComponent
  ],
  exports: [
    FooterComponent,
    FooterDirective,
    FooterContentComponent
  ],
  imports: [
    NgForOf,
    MatTabsModule,
    KubernetesTerminalModule
  ]
})
export class FooterModule {

}
