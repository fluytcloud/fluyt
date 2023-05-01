package com.fluytcloud.jpa;

import com.fluytcloud.core.entities.UserInfoContext;
import io.quarkus.hibernate.orm.PersistenceUnitExtension;
import io.quarkus.hibernate.orm.runtime.tenant.TenantResolver;

import javax.enterprise.context.RequestScoped;
import java.util.Objects;

@PersistenceUnitExtension
@RequestScoped
public class CustomTenantResolver implements TenantResolver {

    @Override
    public String resolveTenantId() {
        var currentUser = UserInfoContext.getCurrentUserInfo();
        if (Objects.nonNull(currentUser) && currentUser.organization().isPresent()) {
            return currentUser.organization().get().identifier();
        }

        return getDefaultTenantId();
    }

    @Override
    public String getDefaultTenantId() {
        return "admin";
    }

}