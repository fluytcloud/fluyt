package com.fluytcloud.kubernetes.datasources.database.relational.model;

import com.fluytcloud.kubernetes.entities.ConnectionType;
import org.hibernate.annotations.Type;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "K8S_CLUSTER")
public class ClusterModel {

    @Id
    @Column(name = "ID")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "NAME", length = 100, nullable = false)
    private String name;

    @Enumerated(EnumType.STRING)
    @Column(name = "CONNECTION_TYPE", nullable = false)
    private ConnectionType connectionType;

    @Column(name = "URL")
    private String url;

    @Column(name = "TOKEN")
    private String token;

    @Column(name = "USERNAME", length = 50)
    private String username;

    @Column(name = "PASSWORD")
    private String password;

    @Column(name = "VALIDATE_SSL")
    private boolean validateSSL;

    public Integer getId() {
        return id;
    }

    public ClusterModel setId(Integer id) {
        this.id = id;
        return this;
    }

    public String getName() {
        return name;
    }

    public ClusterModel setName(String name) {
        this.name = name;
        return this;
    }

    public ConnectionType getConnectionType() {
        return connectionType;
    }

    public ClusterModel setConnectionType(ConnectionType connectionType) {
        this.connectionType = connectionType;
        return this;
    }

    public String getUrl() {
        return url;
    }

    public ClusterModel setUrl(String url) {
        this.url = url;
        return this;
    }

    public String getToken() {
        return token;
    }

    public ClusterModel setToken(String token) {
        this.token = token;
        return this;
    }

    public String getUsername() {
        return username;
    }

    public ClusterModel setUsername(String username) {
        this.username = username;
        return this;
    }

    public String getPassword() {
        return password;
    }

    public ClusterModel setPassword(String password) {
        this.password = password;
        return this;
    }

    public boolean isValidateSSL() {
        return validateSSL;
    }

    public ClusterModel setValidateSSL(boolean validateSSL) {
        this.validateSSL = validateSSL;
        return this;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ClusterModel cluster = (ClusterModel) o;

        return Objects.equals(id, cluster.id);
    }

    @Override
    public int hashCode() {
        return id != null ? id.hashCode() : 0;
    }
}
