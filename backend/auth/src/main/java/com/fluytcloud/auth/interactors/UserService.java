package com.fluytcloud.auth.interactors;

import com.fluytcloud.auth.entities.User;
import com.fluytcloud.auth.repositories.UserRepository;

import javax.enterprise.context.ApplicationScoped;
import java.util.*;

@ApplicationScoped
public class UserService {

    private final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public boolean create(User user) {
        return userRepository.create(user);
    }

    public Optional<User> findByUsername(String username) {
        return userRepository.findByUsername(username);
    }

    public boolean existsByUsername(String username) {
        return userRepository.existsByUsername(username);
    }

    public void setGroups(String username, String... groupsPath) {
        userRepository.setGroups(username, List.of(groupsPath));
    }

    public void addGroups(String username, String... groupsPath) {
        userRepository.addGroups(username, Arrays.asList(groupsPath));
    }

}
