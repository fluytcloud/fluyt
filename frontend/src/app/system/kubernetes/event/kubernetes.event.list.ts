export interface KubernetesEventList {
  type: string;
  message: string;
  namespace: string;
  object: string;
  source: string;
  age: string;
  lastSeen: string;
  name: string;
}
