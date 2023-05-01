package com.fluytcloud.auth.transport.http.mapper;

import com.fluytcloud.auth.transport.http.response.UserInfoResponse;
import com.fluytcloud.core.entities.UserInfo;

public class UserInfoMapper {

    public UserInfoResponse map(UserInfo userInfo) {
        return new UserInfoResponse(
                userInfo.name(),
                userInfo.username(),
                userInfo.organization().isPresent() ? userInfo.organization().get().name() : null
        );
    }

}
