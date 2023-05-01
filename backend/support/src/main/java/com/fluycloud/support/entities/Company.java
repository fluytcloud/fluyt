package com.fluycloud.support.entities;

import java.util.Objects;

public class Company {
    private Integer id;
    private String companyName;
    private String tradeName;
    private String email;

    public static FilialBuilder builder() {
        return new FilialBuilder();
    }

    public static class FilialBuilder {

        private final Company company = new Company();

        public FilialBuilder id(Integer id) {
            this.company.id = id;
            return this;
        }
        public FilialBuilder companyName(String companyName) {
            this.company.companyName = companyName;
            return this;
        }

        public FilialBuilder tradeName(String tradeName) {
            this.company.tradeName = tradeName;
            return this;
        }

        public FilialBuilder email(String email) {
            this.company.email = email;
            return this;
        }

        public Company build() {
            return this.company;
        }
    }

    public Integer getId() {
        return id;
    }

    public String getCompanyName() {
        return companyName;
    }

    public String getTradeName() {
        return tradeName;
    }

    public String getEmail() {
        return email;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Company company = (Company) o;

        return Objects.equals(id, company.id);
    }

    @Override
    public int hashCode() {
        return id != null ? id.hashCode() : 0;
    }
}
