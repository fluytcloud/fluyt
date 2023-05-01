package com.fluytcloud.admin.transport.mapper;

import com.fluytcloud.admin.entities.Customer;
import com.fluytcloud.admin.transport.request.CustomerRequest;
import com.fluytcloud.admin.transport.response.CustomerListResponse;
import com.fluytcloud.admin.transport.response.CustomerResponse;
import com.fluytcloud.admin.util.StringUtil;

public class CustomerMapper {

    public CustomerListResponse mapResponseList(Customer customer) {
        return new CustomerListResponse(
                customer.getId(),
                customer.getCompanyName(),
                customer.getTradeName(),
                customer.getActive()
        );
    }

    public CustomerResponse mapResponse(Customer customer) {
        return new CustomerResponse(
                customer.getId(),
                customer.getCompanyName(),
                customer.getTradeName(),
                customer.getEmail(),
                customer.getActive()
        );
    }

    public Customer map(CustomerRequest request) {
        return new Customer.CustomerBuilder()
                .companyName(request.companyName())
                .tradeName(request.tradeName())
                .email(request.email())
                .schemaName(StringUtil.stripAccents(request.companyName()))
                .active(request.active())
                .build();
    }

}
