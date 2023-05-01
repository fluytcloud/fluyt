package com.fluytcloud.auth.entities;

import java.util.List;
import java.util.Objects;
import java.util.Optional;

public class User {

    private final String email;
    private final String name;
    private final String firstName;
    private final String lastName;
    private final List<Group> groups;

    public User(String email, String name, List<Group> groups) {
        this.email = Objects.requireNonNull(email);
        this.name = Objects.requireNonNull(name);
        this.groups = groups;

        var splitName = name.split(" ");
        firstName = splitName[0];
        if (splitName.length > 1) {
            lastName = splitName[1];
        } else {
            lastName = null;
        }

    }

    public String getEmail() {
        return email;
    }

    public String getName() {
        return name;
    }

    public String getFirstName() {
        return firstName;
    }

    public Optional<String> getLastName() {
        return Optional.ofNullable(lastName);
    }

    public List<Group> getGroups() {
        return groups;
    }
}
