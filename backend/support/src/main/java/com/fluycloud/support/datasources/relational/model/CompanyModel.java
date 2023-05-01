package com.fluycloud.support.datasources.relational.model;

import javax.persistence.*;

@Entity
@Table(name = "COMPANY")
public class CompanyModel {

    @Id
    @Column(name = "ID")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "COMPANY_NAME", length = 100, nullable = false)
    private String companyName;

    @Column(name = "TRADE_NAME", length = 100, nullable = false)
    private String tradeName;

    @Column(name = "EMAIL", length = 100, nullable = false)
    private String email;

    public Integer getId() {
        return id;
    }

    public CompanyModel setId(Integer id) {
        this.id = id;
        return this;
    }

    public String getCompanyName() {
        return companyName;
    }

    public CompanyModel setCompanyName(String companyName) {
        this.companyName = companyName;
        return this;
    }

    public String getTradeName() {
        return tradeName;
    }

    public CompanyModel setTradeName(String tradeName) {
        this.tradeName = tradeName;
        return this;
    }

    public String getEmail() {
        return email;
    }

    public CompanyModel setEmail(String email) {
        this.email = email;
        return this;
    }

}
