import {Pipe, PipeTransform} from "@angular/core";

@Pipe({
  name: "podContainerEnv"
})
export class PipesPodContainerEnvComponent implements PipeTransform {

  transform(value: any, ...args: any[]): any {
    let env = '';

    if (value.name) {
      env += value.name;
    }

    if (value.value) {
      if (env.length > 0) {
        env += ':';
      }
      env += value.value;
    }

    if (value.valueFrom?.fieldRef) {
      if (env.length > 0) {
        env += ':';
      }
      env += 'fieldRef(' + value.valueFrom.fieldRef.apiVersion + ':' + value.valueFrom.fieldRef.fieldPath + ')';
    }

    return env;
  }

}
