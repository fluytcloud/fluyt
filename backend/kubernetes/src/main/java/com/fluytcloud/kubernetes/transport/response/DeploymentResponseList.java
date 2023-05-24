package com.fluytcloud.kubernetes.transport.response;

import java.util.List;

public class DeploymentResponseList {

    private final String name;
    private final String namespace;
    private final Integer desired;
    private final Integer current;
    private final Integer replicas;
    private final String age;

    private final List<Condition> conditions;

    public DeploymentResponseList(String name, String namespace, Integer desired, Integer current, Integer replicas, String age, List<Condition> conditions) {
        this.name = name;
        this.namespace = namespace;
        this.desired = desired;
        this.current = current;
        this.replicas = replicas;
        this.age = age;
        this.conditions = conditions;
    }

    public String getName() {
        return name;
    }

    public String getNamespace() {
        return namespace;
    }

    public Integer getDesired() {
        return desired;
    }

    public Integer getCurrent() {
        return current;
    }

    public Integer getReplicas() {
        return replicas;
    }

    public String getAge() {
        return age;
    }

    public List<Condition> getConditions() {
        return conditions;
    }

    public static class Condition {
        private final String reason;
        private final String status;
        private final String type;
        private final String message;

        public Condition(String reason, String status, String type, String message) {
            this.reason = reason;
            this.status = status;
            this.type = type;
            this.message = message;
        }

        public String getReason() {
            return reason;
        }

        public String getStatus() {
            return status;
        }

        public String getType() {
            return type;
        }

        public String getMessage() {
            return message;
        }
    }
}
