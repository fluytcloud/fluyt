import {Component, Input} from "@angular/core";

@Component({
  selector: 'app-kubernetes-terminal',
  templateUrl: './kubernetes.terminal.component.html',
  styleUrls: ['./kubernetes.terminal.component.scss']
})
export class KubernetesTerminalComponent {

  @Input() title!: String;

}
