package com.fluytcloud.auth.repositories;

import com.fluytcloud.auth.entities.User;

import java.util.List;
import java.util.Optional;

public interface UserRepository {

    boolean create(User user);

    Optional<User> findByUsername(String username);

    boolean existsByUsername(String username);

    void setGroups(String username, List<String> groupsPath);

    void addGroups(String username, List<String> groupsPath);

}
