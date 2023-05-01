package com.fluytcloud.auth.datasources.keycloak.mapper;

import com.fluytcloud.auth.entities.Group;
import com.fluytcloud.auth.entities.User;
import org.keycloak.representations.idm.UserRepresentation;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

public class UserRepresentationMapper {

    public UserRepresentation map(User user) {
        UserRepresentation userRepresentation = new UserRepresentation();
        userRepresentation.setEnabled(true);
        userRepresentation.setUsername(user.getEmail());
        userRepresentation.setFirstName(user.getFirstName());
        if (user.getLastName().isPresent()) {
            userRepresentation.setLastName(user.getLastName().get());
        }

        userRepresentation.setEmail(user.getEmail());

        List<String> subGroups = new ArrayList<>();
        for (Group group : user.getGroups()) {
            for (Group subGroup : group.subGroups()) {
                subGroups.add(group.name() + "/" + subGroup.name());
            }
        }

        userRepresentation.setGroups(subGroups);
        return userRepresentation;
    }

    public User map(UserRepresentation userRepresentation) {
        var groupsRepresentation = userRepresentation.getGroups()
                .stream()
                .map(group -> group.split("/")[1])
                .collect(Collectors.toSet());


        List<Group> groups = new ArrayList<>();
        for (String groupRepresentation : groupsRepresentation) {
            var subGroups = userRepresentation.getGroups()
                    .stream()
                    .map(group -> group.split("/"))
                    .filter(groupSplit -> groupSplit[1].equals(groupRepresentation))
                    .map(groupSplit -> groupSplit[2])
                    .collect(Collectors.toSet())
                    .stream()
                    .map(group -> new Group(group, Collections.emptyList()))
                    .toList();
            var group = new Group(groupRepresentation, subGroups);
            groups.add(group);
        }

        return new User(
                userRepresentation.getUsername(),
                userRepresentation.getFirstName() + " " + userRepresentation.getLastName(),
                groups
        );
    }

}
