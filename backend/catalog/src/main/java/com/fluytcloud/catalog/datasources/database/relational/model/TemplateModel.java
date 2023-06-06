package com.fluytcloud.catalog.datasources.database.relational.model;

import com.fluytcloud.scm.datasources.database.relational.model.ScmModel;
import jakarta.persistence.*;

import java.util.Objects;

@Entity
@Table(name = "TEMPLATE")
public class TemplateModel {

    @Id
    @Column(name = "ID")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "NAME", length = 100, nullable = false)
    private String name;

    @ManyToOne
    @JoinColumn(name = "TEMPLATE_SCM_ID", nullable = false)
    private ScmModel templateScm;

    @Column(name = "TEMPLATE_REPOSITORY", length = 100, nullable = false)
    private String templateRepository;

    @Column(name = "TEMPLATE_BRANCH", length = 100, nullable = false)
    private String templateBranch;

    @ManyToOne
    @JoinColumn(name = "TARGET_SCM_ID", nullable = false)
    private ScmModel targetScm;

    @Column(name = "TARGET_BRANCH", length = 100, nullable = false)
    private String targetBranch;

    public Integer getId() {
        return id;
    }

    public TemplateModel setId(Integer id) {
        this.id = id;
        return this;
    }

    public String getName() {
        return name;
    }

    public TemplateModel setName(String name) {
        this.name = name;
        return this;
    }

    public ScmModel getTemplateScm() {
        return templateScm;
    }

    public TemplateModel setTemplateScm(ScmModel templateScm) {
        this.templateScm = templateScm;
        return this;
    }

    public String getTemplateRepository() {
        return templateRepository;
    }

    public TemplateModel setTemplateRepository(String templateRepository) {
        this.templateRepository = templateRepository;
        return this;
    }

    public String getTemplateBranch() {
        return templateBranch;
    }

    public TemplateModel setTemplateBranch(String templateBranch) {
        this.templateBranch = templateBranch;
        return this;
    }

    public ScmModel getTargetScm() {
        return targetScm;
    }

    public TemplateModel setTargetScm(ScmModel targetScm) {
        this.targetScm = targetScm;
        return this;
    }

    public String getTargetBranch() {
        return targetBranch;
    }

    public TemplateModel setTargetBranch(String targetBranch) {
        this.targetBranch = targetBranch;
        return this;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        TemplateModel cluster = (TemplateModel) o;

        return Objects.equals(id, cluster.id);
    }

    @Override
    public int hashCode() {
        return id != null ? id.hashCode() : 0;
    }
}
