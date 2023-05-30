export interface KubernetesEventDetail {
  creationTimestamp: Date;
  namespace: string;
  name: string;
  message: string;
  reason: string;
  source: string;
  firstSeen: string;
  lastSeen: string;
  count: number,
  involvedObject: KubernetesInvolvedObject,
}

export interface KubernetesInvolvedObject {
  name: string;
  namespace: string;
  kind: string;
  fieldPath: string;
}
