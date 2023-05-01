import {Pipe, PipeTransform} from "@angular/core";

@Pipe({
  name: "podSeverity"
})
export class PipesPodSeverityComponent implements PipeTransform {

  transform(value: any, ...args: any[]): any {
    if (value === 'Running' || value === 'Succeeded') {
      return 'primary'
    }

    return 'warn';
  }

}
