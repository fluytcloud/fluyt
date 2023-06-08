package com.fluytcloud.scm.datasources.database.relational.model;

import com.fluytcloud.scm.entities.ScmType;
import jakarta.persistence.*;

import java.util.Objects;

@Entity
@Table(name = "SCM")
public class ScmModel {

    @Id
    @Column(name = "ID")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "NAME", length = 100, nullable = false)
    private String name;

    @Enumerated(EnumType.STRING)
    @Column(name = "TYPE", nullable = false)
    private ScmType type;

    @Column(name = "URL")
    private String url;

    @Column(name = "USERNAME")
    private String username;

    @Column(name = "TOKEN")
    private String token;

    @Column(name = "ORGANIZATION")
    private String organization;

    public Integer getId() {
        return id;
    }

    public ScmModel setId(Integer id) {
        this.id = id;
        return this;
    }

    public String getName() {
        return name;
    }

    public ScmModel setName(String name) {
        this.name = name;
        return this;
    }

    public ScmType getType() {
        return type;
    }

    public ScmModel setType(ScmType type) {
        this.type = type;
        return this;
    }

    public String getUrl() {
        return url;
    }

    public ScmModel setUrl(String url) {
        this.url = url;
        return this;
    }

    public String getUsername() {
        return username;
    }

    public ScmModel setUsername(String username) {
        this.username = username;
        return this;
    }

    public String getToken() {
        return token;
    }

    public ScmModel setToken(String token) {
        this.token = token;
        return this;
    }

    public String getOrganization() {
        return organization;
    }

    public ScmModel setOrganization(String organization) {
        this.organization = organization;
        return this;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ScmModel cluster = (ScmModel) o;

        return Objects.equals(id, cluster.id);
    }

    @Override
    public int hashCode() {
        return id != null ? id.hashCode() : 0;
    }
}
