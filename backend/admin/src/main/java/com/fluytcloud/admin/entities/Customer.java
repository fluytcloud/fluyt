package com.fluytcloud.admin.entities;

import java.util.Objects;

public class Customer {

    private Integer id;
    private String schemaName;
    private String companyName;
    private String tradeName;
    private String email;
    private Boolean active;

    public static CustomerBuilder builder() {
        return new CustomerBuilder();
    }

    public static class CustomerBuilder {

        private final Customer customer = new Customer();

        public CustomerBuilder id(Integer id) {
            this.customer.id = id;
            return this;
        }

        public CustomerBuilder schemaName(String schemaName) {
            this.customer.schemaName = schemaName;
            return this;
        }

        public CustomerBuilder companyName(String companyName) {
            this.customer.companyName = companyName;
            return this;
        }

        public CustomerBuilder tradeName(String tradeName) {
            this.customer.tradeName = tradeName;
            return this;
        }

        public CustomerBuilder email(String email) {
            this.customer.email = email;
            return this;
        }

        public CustomerBuilder active(Boolean active) {
            this.customer.active = active;
            return this;
        }

        public Customer build() {
            return this.customer;
        }

    }

    public Integer getId() {
        return id;
    }

    public String getSchemaName() {
        return schemaName;
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

    public Boolean getActive() {
        return active;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Customer customer = (Customer) o;

        return Objects.equals(id, customer.id);
    }

    @Override
    public int hashCode() {
        return id != null ? id.hashCode() : 0;
    }
}
