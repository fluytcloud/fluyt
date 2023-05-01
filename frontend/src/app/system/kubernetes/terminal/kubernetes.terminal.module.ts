import {NgModule} from "@angular/core";
import {KubernetesTerminalComponent} from "./kubernetes.terminal.component";
import {CommonModule} from "@angular/common";

@NgModule({
  declarations: [
    KubernetesTerminalComponent
  ],
  exports: [
    KubernetesTerminalComponent
  ],
  imports: [
    CommonModule
  ]
})
export class KubernetesTerminalModule {

}
