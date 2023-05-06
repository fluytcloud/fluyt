export interface KubernetesWorkloadCronJobList {
  name: string;
  namespace: string;
  schedule: string;
  suspend: boolean,
  active: number;
  lastSchedule: string;
  age: string;
}
