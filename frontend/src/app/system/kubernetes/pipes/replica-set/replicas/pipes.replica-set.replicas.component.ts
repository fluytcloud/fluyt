import {Pipe, PipeTransform} from "@angular/core";

@Pipe({
  name: "replicaSetReplicas"
})
export class PipesReplicaSetReplicasComponent implements PipeTransform {

  transform(value: any, ...args: any[]): any {
    return value?.availableReplicas + ' current / ' + value?.replicas + ' desired';
  }

}
