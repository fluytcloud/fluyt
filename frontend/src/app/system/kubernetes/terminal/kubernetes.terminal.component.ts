import {AfterViewInit, Component, Input, OnDestroy, OnInit, ViewChild} from "@angular/core";
import {KubernetesWorkloadPodList} from "../workload/pod/kubernetes.workload.pod.list";
import {NgTerminal} from "ng-terminal";
import {KubernetesTerminalService} from "./kubernetes.terminal.service";

@Component({
  selector: 'app-kubernetes-terminal',
  templateUrl: './kubernetes.terminal.component.html',
  styleUrls: ['./kubernetes.terminal.component.scss']
})
export class KubernetesTerminalComponent implements OnInit, OnDestroy, AfterViewInit {

  @Input() cluster!: number;
  @Input() pod!: KubernetesWorkloadPodList;

  @ViewChild('terminal', {static: false}) terminal?: NgTerminal;

  context?: string;

  constructor(private kubernetesTerminalService: KubernetesTerminalService) {
  }

  ngOnInit(): void {
    console.log(this.pod);

    this.context = new Date().getTime().toString();

    const request = {
      context: this.context,
      cluster: this.cluster,
      namespace: this.pod.namespace,
      pod: this.pod.name,
      container: this.pod.containers[0].name,
      command: '/bin/sh',
      lines: 10,
      columns: 50
    }

    this.kubernetesTerminalService.open(this.context, request).subscribe(() => {
      setTimeout(() => this.kubernetesTerminalService.send(this.context!, request), 1000);
      this.kubernetesTerminalService.connect(this.context!).subscribe(data => {
        this.terminal?.write(data.message);
      });
    });
  }

  ngAfterViewInit(): void {
    this.terminal?.onData().subscribe((value) => {
      const request = {
        context: this.context,
        cluster: this.cluster,
        namespace: this.pod.namespace,
        pod: this.pod.name,
        container: this.pod.containers[0].name,
        command: value
      };
      this.kubernetesTerminalService.send(this.context!, request);
    })
  }

  ngOnDestroy(): void {
    this.kubernetesTerminalService.close(this.context!);
  }

}
