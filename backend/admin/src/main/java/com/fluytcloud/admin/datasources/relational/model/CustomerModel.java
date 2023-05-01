package com.fluytcloud.admin.datasources.relational.model;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "CUSTOMER", schema = "admin")
public class CustomerModel {

    @Id
    @Column(name = "ID")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "SCHEMA_NAME", length = 63, nullable = false, unique = true)
    private String schemaName;

    @Column(name = "COMPANY_NAME", length = 100, nullable = false)
    private String companyName;

    @Column(name = "TRADE_NAME", length = 100, nullable = false)
    private String tradeName;

    @Column(name = "EMAIL", length = 100, nullable = false)
    private String email;

    @Column(name = "ACTIVE", nullable = false)
    private Boolean active;

    public Integer getId() {
        return id;
    }

    public CustomerModel setId(Integer id) {
        this.id = id;
        return this;
    }

    public String getSchemaName() {
        return schemaName;
    }

    public CustomerModel setSchemaName(String schemaName) {
        this.schemaName = schemaName;
        return this;
    }

    public String getCompanyName() {
        return companyName;
    }

    public CustomerModel setCompanyName(String companyName) {
        this.companyName = companyName;
        return this;
    }

    public String getTradeName() {
        return tradeName;
    }

    public CustomerModel setTradeName(String tradeName) {
        this.tradeName = tradeName;
        return this;
    }

    public String getEmail() {
        return email;
    }

    public CustomerModel setEmail(String email) {
        this.email = email;
        return this;
    }

    public Boolean getActive() {
        return active;
    }

    public CustomerModel setActive(Boolean active) {
        this.active = active;
        return this;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        CustomerModel that = (CustomerModel) o;
        return Objects.equals(id, that.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }
}
