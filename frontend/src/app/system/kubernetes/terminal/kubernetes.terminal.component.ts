import {AfterViewInit, Component, Input, OnDestroy, OnInit, ViewChild} from "@angular/core";
import {KubernetesWorkloadPodList} from "../workload/pod/kubernetes.workload.pod.list";
import {NgTerminal} from "ng-terminal";
import {KubernetesTerminalService} from "./kubernetes.terminal.service";
import * as uuid from 'uuid';
import {Subscription} from "rxjs";

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
  subscription?: Subscription;
  lastMessages: string[] = [];
  commands: string[] = [];
  actualCommand = 0;
  invalidExec = 'OCI runtime exec failed: exec failed: unable to start container process: exec';

  constructor(private kubernetesTerminalService: KubernetesTerminalService) {
    this.commands = ['/bin/bash', '/bin/sh'];
  }

  ngOnInit(): void {
    this.context = uuid.v4()!;
    this.lastMessages = [];

    const request = {
      context: this.context,
      cluster: this.cluster,
      namespace: this.pod.namespace,
      pod: this.pod.name,
      container: this.pod.containers[0].name,
      command: this.commands[this.actualCommand]
    }

    this.kubernetesTerminalService.connect(this.context!).subscribe(websocket => {
      this.kubernetesTerminalService.send(this.context!, request);
      this.subscription = websocket.subscribe(data => {
        this.write(data.message);
      });
    });
  }

  private write(message: string) {
    this.lastMessages.push(message);
    if (this.lastMessages.length > 100) {
      this.lastMessages.splice(0, this.lastMessages.length - 100);
    }

    this.terminal?.write(message);

    if (this.lastMessages.join('') === this.invalidExec) {
      setTimeout(() => this.changeCommand(), 100);
    }
  }

  changeCommand() {
    this.ngOnDestroy();
    if (this.commands[this.actualCommand += 1]) {
      this.ngOnInit();
    }
  }

  ngAfterViewInit(): void {
    this.terminal?.onData().subscribe(value => {
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
    this.subscription?.unsubscribe();
  }

}
