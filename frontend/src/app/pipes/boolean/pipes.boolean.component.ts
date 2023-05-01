import {Pipe, PipeTransform} from "@angular/core";

@Pipe({
  name: "boolean"
})
export class PipesBooleanComponent implements PipeTransform {

  transform(value: any, ...args: any[]): any {
    return value ? "Sim" : "Não";
  }

}
