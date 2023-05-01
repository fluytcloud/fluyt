package com.fluytcloud.auth.datasources.keycloak;

import com.fluytcloud.auth.entities.Group;
import com.fluytcloud.auth.repositories.GroupRepository;
import org.keycloak.admin.client.CreatedResponseUtil;
import org.keycloak.admin.client.resource.GroupsResource;
import org.keycloak.representations.idm.GroupRepresentation;

import javax.enterprise.context.ApplicationScoped;
import javax.ws.rs.core.Response;

@ApplicationScoped
public class GroupRepositoryImpl extends KeycloakConnection implements GroupRepository {

    private final GroupsResource groupsResource;

    public GroupRepositoryImpl() {
        this.groupsResource = getRealmResource().groups();
    }

    @Override
    public boolean create(Group group) {
        GroupRepresentation groupRepresentation = new GroupRepresentation();
        groupRepresentation.setName(group.name());
        groupRepresentation.setPath(group.name());
        Response response = this.groupsResource.add(groupRepresentation);
        var groupId = CreatedResponseUtil.getCreatedId(response);

        var groupKeycloak = groupsResource.group(groupId);

        group.subGroups()
                .stream()
                .map(subGroup -> getGroupRepresentation(group.name(), subGroup.name()))
                .forEach(groupKeycloak::subGroup);

        return response.getStatus() == 201;
    }

    private GroupRepresentation getGroupRepresentation(String groupName, String subGroupName) {
        var subGroupRepresentation = new GroupRepresentation();
        subGroupRepresentation.setName(subGroupName);
        subGroupRepresentation.setPath(groupName + "/" + subGroupName);
        return subGroupRepresentation;
    }

    @Override
    public boolean exists(String groupName) {
        var groups = groupsResource.groups(
                groupName,
                0,
                1
        );
        return !groups.isEmpty();
    }

    @Override
    public boolean exists(String groupName, String subGroupName) {
        var groups = groupsResource.groups(
                groupName,
                0,
                1
        );
        if (groups.isEmpty()) {
            return false;
        }

        return groups.get(0).getSubGroups()
                .stream()
                .anyMatch(subGroup -> subGroup.getName().equals(subGroupName));
    }

    @Override
    public void addSubGroup(String groupName, String subGroupName) {
        var groups = groupsResource.groups(
                groupName,
                0,
                1
        );
        if (groups.isEmpty()) {
            throw new RuntimeException("Grupo não existe");
        }
        var groupRepresentation = groups.get(0);


        var subGroupRepresentation = getGroupRepresentation(groupName, subGroupName);
        var subGroups = groupRepresentation.getSubGroups();
        subGroups.add(subGroupRepresentation);
        groupRepresentation.setSubGroups(subGroups);
    }

}
