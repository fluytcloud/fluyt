export interface KubernetesStoragePersistentVolumeList {
  name: string;
  storageClass: string;
  capacity: number;
  claim: string;
  status: string;
  age: string;
}
