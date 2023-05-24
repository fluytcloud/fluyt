import {NgModule} from "@angular/core";
import {KubernetesTerminalComponent} from "./kubernetes.terminal.component";
import {CommonModule} from "@angular/common";
import {NgTerminalModule} from "ng-terminal";
import {KubernetesTerminalService} from "./kubernetes.terminal.service";

@NgModule({
  declarations: [
    KubernetesTerminalComponent
  ],
  exports: [
    KubernetesTerminalComponent
  ],
  imports: [
    CommonModule,
    NgTerminalModule
  ],
  providers: [
    KubernetesTerminalService
  ]
})
export class KubernetesTerminalModule {

}
