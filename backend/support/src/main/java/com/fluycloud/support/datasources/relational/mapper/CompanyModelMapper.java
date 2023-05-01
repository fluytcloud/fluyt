package com.fluycloud.support.datasources.relational.mapper;

import com.fluycloud.support.datasources.relational.model.CompanyModel;
import com.fluycloud.support.entities.Company;

public interface CompanyModelMapper {

    CompanyModelMapper INSTANCE = new CompanyModelMapper() {};

    default Company map(CompanyModel companyModel) {
        return new Company.FilialBuilder()
                .id(companyModel.getId())
                .companyName(companyModel.getCompanyName())
                .tradeName(companyModel.getTradeName())
                .email(companyModel.getEmail())
                .build();
    }

    default CompanyModel map(Company company) {
        return new CompanyModel()
                .setId(company.getId())
                .setCompanyName(company.getCompanyName())
                .setTradeName(company.getTradeName())
                .setEmail(company.getEmail());
    }
}
