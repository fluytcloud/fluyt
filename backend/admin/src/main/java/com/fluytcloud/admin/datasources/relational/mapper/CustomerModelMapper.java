package com.fluytcloud.admin.datasources.relational.mapper;

import com.fluytcloud.admin.datasources.relational.model.CustomerModel;
import com.fluytcloud.admin.entities.Customer;

public class CustomerModelMapper {

    public Customer map(CustomerModel customerModel) {
        return new Customer.CustomerBuilder()
                .id(customerModel.getId())
                .schemaName(customerModel.getSchemaName())
                .companyName(customerModel.getCompanyName())
                .tradeName(customerModel.getTradeName())
                .email(customerModel.getEmail())
                .active(customerModel.getActive())
                .build();
    }

    public CustomerModel map(Customer customer) {
        return new CustomerModel()
                .setId(customer.getId())
                .setSchemaName(customer.getSchemaName())
                .setCompanyName(customer.getCompanyName())
                .setTradeName(customer.getTradeName())
                .setEmail(customer.getEmail())
                .setActive(customer.getActive());
    }

}
