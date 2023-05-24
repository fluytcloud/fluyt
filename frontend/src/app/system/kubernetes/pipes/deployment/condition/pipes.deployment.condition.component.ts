import {Pipe, PipeTransform} from "@angular/core";

@Pipe({
  name: "deploymentCondition"
})
export class PipesDeploymentConditionComponent implements PipeTransform {

  transform(value: any, ...args: any[]): any {
    if (value === 'Available') {
      return 'success'
    }

    if (value === 'Progressing') {
      return 'primary'
    }

    if (value === 'ReplicaFailure') {
      return 'danger'
    }
    return '';
  }

}
