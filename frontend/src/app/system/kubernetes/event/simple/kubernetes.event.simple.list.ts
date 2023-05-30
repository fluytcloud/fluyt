export interface KubernetesEventSimpleList {
  source: string;
  count: number;
  object: string;
  lastSeen: Date;
  message: string;
}
