package com.fluytcloud.kubernetes.entities;

public enum WorkdloadType {

    REPLICASET("ReplicaSet"),
    DEPLOYMENT("Deployment"),
    STATEFULSET("StatefulSet"),
    JOB("Job"),
    CRONJOB("CronJob"),
    POD("Pode"),
    NODE("Node"),
    DAEMONSET("DaemonSet"),
    HPA("HorizontalPodAutoscaler"),
    SERVICE("Service"),
    ENDPOINTS("Endpoints"),
    PERSISTENT_VOLUME_CLAIM("PersistentVolumeClaim"),
    PERSISTENTE_VOLUME("PersistentVolume"),
    SERVICE_ACCOUNT("ServiceAccount");

    private final String label;

    WorkdloadType(String label) {
        this.label = label;
    }

    public String getLabel() {
        return label;
    }

    public boolean equalsIgnoreCase(String label) {
        return this.label.equalsIgnoreCase(label);
    }

}
