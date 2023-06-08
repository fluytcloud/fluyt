package com.fluytcloud.catalog.datasources.database.relational.model;

import jakarta.persistence.*;

import java.util.UUID;

@Entity
@Table(name = "TEMPLATE_STATUS")
public class TemplateStatusModel {

    @Id
    @Column(name = "ID")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "UUID")
    private UUID uuid;

    @Column(name = "STEP")
    private String step;

    @Column(name = "IS_ERROR")
    private boolean error;

    @Column(name = "MESSAGE")
    private String message;

    public Integer getId() {
        return id;
    }

    public TemplateStatusModel setId(Integer id) {
        this.id = id;
        return this;
    }

    public UUID getUuid() {
        return uuid;
    }

    public TemplateStatusModel setUuid(UUID uuid) {
        this.uuid = uuid;
        return this;
    }

    public String getStep() {
        return step;
    }

    public TemplateStatusModel setStep(String step) {
        this.step = step;
        return this;
    }

    public boolean isError() {
        return error;
    }

    public TemplateStatusModel setError(boolean error) {
        this.error = error;
        return this;
    }

    public String getMessage() {
        return message;
    }

    public TemplateStatusModel setMessage(String message) {
        this.message = message;
        return this;
    }
}
