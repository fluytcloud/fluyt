package com.fluytcloud.api.transport.mapper;

import com.fluycloud.support.entities.Company;
import com.fluytcloud.api.transport.request.CompanyRequest;
import com.fluytcloud.api.transport.response.CompanyListResponse;
import com.fluytcloud.api.transport.response.CompanyResponse;

public class CompanyMapper {

    public CompanyListResponse mapResponseList(Company company) {
        return new CompanyListResponse(
                company.getId(),
                company.getCompanyName(),
                company.getTradeName()
        );
    }

    public CompanyResponse mapResponse(Company company) {
        return new CompanyResponse(
                company.getId(),
                company.getCompanyName(),
                company.getTradeName(),
                company.getEmail()
        );
    }

    public Company map(CompanyRequest request) {
        return Company.builder()
                .id(request.id())
                .companyName(request.companyName())
                .tradeName(request.tradeName())
                .email(request.email())
                .build();
    }

}
