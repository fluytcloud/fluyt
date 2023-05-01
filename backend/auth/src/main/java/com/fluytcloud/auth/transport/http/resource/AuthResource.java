package com.fluytcloud.auth.transport.http.resource;

import com.fluytcloud.auth.interactors.UserInfoService;
import com.fluytcloud.auth.transport.http.mapper.UserInfoMapper;
import com.fluytcloud.auth.transport.http.response.UserInfoResponse;
import com.fluytcloud.core.entities.Company;
import com.fluytcloud.core.entities.UserInfoContext;

import javax.inject.Inject;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.QueryParam;

@Path("/auth")
public class AuthResource {

    @Inject
    UserInfoService userInfoService;

    private static final UserInfoMapper USER_INFO_MAPPER = new UserInfoMapper();

    @GET
    @Path("/full-authentication")
    public boolean fullAuthentication() {
        return UserInfoContext.getCurrentUserInfo() != null;
    }

    @POST
    @Path("/full-authentication")
    public void post(String identifier) {
        userInfoService.set(identifier);
    }

    @POST
    @Path("/change-company")
    public void post(Integer companyId) {
        userInfoService.setUserCompany(new Company(companyId, null));
    }

    @POST
    @Path("/logout")
    public void logout() {
        userInfoService.delete();
    }

    @GET
    public UserInfoResponse get() {
        return USER_INFO_MAPPER.map(UserInfoContext.getCurrentUserInfo());
    }

}
