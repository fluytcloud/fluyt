package com.fluytcloud.core.entities;

public class UserInfoContext {

    private static final ThreadLocal<UserInfo> currentUserInfo = ThreadLocal.withInitial(() -> null);

    public static void setCurrentTenant(UserInfo userInfo) {
        currentUserInfo.set(userInfo);
    }

    public static UserInfo getCurrentUserInfo() {
        return currentUserInfo.get();
    }

    public static void clear() {
        currentUserInfo.remove();
    }

}
