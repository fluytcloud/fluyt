package com.fluytcloud.auth.datasources.relational.mapper;

import com.fluytcloud.auth.datasources.relational.model.CustomerModel;
import com.fluytcloud.auth.entities.Customer;

public class CustomerModelMapper {

    public Customer map(CustomerModel customerModel) {
        return new Customer(
                customerModel.getId(),
                customerModel.getTradeName(),
                customerModel.getSchemaName()
        );
    }

    public CustomerModel map(Customer customer) {
        return new CustomerModel()
                .setId(customer.id())
                .setSchemaName(customer.identifier())
                .setTradeName(customer.name());
    }

}
