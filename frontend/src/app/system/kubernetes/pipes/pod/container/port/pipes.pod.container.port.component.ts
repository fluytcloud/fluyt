import {Pipe, PipeTransform} from "@angular/core";

@Pipe({
  name: "podContainerPort"
})
export class PipesPodContainerPortComponent implements PipeTransform {

  transform(value: any, ...args: any[]): any {
    let port = '';

    if (value.name) {
      port += value.name;
    }

    if (value.containerPort) {
      if (port.length > 0) {
        port += ':';
      }
      port += value.containerPort;
    }

    port += '/' + value.protocol;

    return port;
  }

}
