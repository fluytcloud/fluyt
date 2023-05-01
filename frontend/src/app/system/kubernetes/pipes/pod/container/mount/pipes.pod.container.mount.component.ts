import {Pipe, PipeTransform} from "@angular/core";

@Pipe({
  name: "podContainerMount"
})
export class PipesPodContainerMountComponent implements PipeTransform {

  transform(value: any, ...args: any[]): any {
    const access = value?.readOnly ? 'ro' : 'rw';

    return value.mountPath + '  [from ' + value.name + ' (' + access +')]';
  }

}
