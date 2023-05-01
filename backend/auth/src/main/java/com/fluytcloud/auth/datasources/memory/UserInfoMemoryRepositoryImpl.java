package com.fluytcloud.auth.datasources.memory;

import com.fluytcloud.auth.repositories.UserInfoRepository;
import com.fluytcloud.core.entities.UserInfo;

import javax.enterprise.context.ApplicationScoped;
import java.util.Map;
import java.util.Optional;
import java.util.concurrent.ConcurrentHashMap;

@ApplicationScoped
public class UserInfoMemoryRepositoryImpl implements UserInfoRepository {

    private static final Map<String, UserInfo> MAP = new ConcurrentHashMap<>();

    @Override
    public void setBySessionId(String sessionId, UserInfo userInfo) {
        MAP.put(sessionId, userInfo);
    }

    @Override
    public Optional<UserInfo> getBySessionId(String sessionId) {
        return Optional.ofNullable(MAP.get(sessionId));
    }

    @Override
    public void deleteBySessionId(String sessionId) {
        MAP.remove(sessionId);
    }

}
