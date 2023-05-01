import {Pipe, PipeTransform} from "@angular/core";

@Pipe({
  name: "podVolumeKind"
})
export class PipesPodVolumeKindComponent implements PipeTransform {

  transform(value: any, ...args: any[]): any {
    let key: keyof typeof value;
    for (key in value) {
      if (value[key] && typeof value[key] === 'object') {
        return key;
      }
    }
    return 'Empty';
  }

}
