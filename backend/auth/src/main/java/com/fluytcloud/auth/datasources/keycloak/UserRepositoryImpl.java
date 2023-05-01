package com.fluytcloud.auth.datasources.keycloak;

import com.fluytcloud.auth.datasources.keycloak.mapper.UserRepresentationMapper;
import com.fluytcloud.auth.entities.User;
import com.fluytcloud.auth.repositories.UserRepository;
import org.keycloak.admin.client.CreatedResponseUtil;
import org.keycloak.admin.client.resource.GroupsResource;
import org.keycloak.admin.client.resource.UserResource;
import org.keycloak.admin.client.resource.UsersResource;
import org.keycloak.representations.idm.CredentialRepresentation;
import org.keycloak.representations.idm.UserRepresentation;

import javax.enterprise.context.ApplicationScoped;
import javax.ws.rs.core.Response;
import java.util.List;
import java.util.Objects;
import java.util.Optional;

@ApplicationScoped
public class UserRepositoryImpl extends KeycloakConnection implements UserRepository {

    private static final UserRepresentationMapper MAPPER  = new UserRepresentationMapper();
    private final GroupsResource groupsResource;
    private final UsersResource usersRessource;

    public UserRepositoryImpl() {
        groupsResource = getRealmResource().groups();
        usersRessource = getRealmResource().users();
    }

    @Override
    public boolean create(User user) {
        UserRepresentation userRepresentation = MAPPER.map(user);

        Response response = usersRessource.create(userRepresentation);
        if (response.getStatus() == 201) {
            CredentialRepresentation passwordCred = new CredentialRepresentation();
            passwordCred.setTemporary(false);
            passwordCred.setType(CredentialRepresentation.PASSWORD);
            passwordCred.setValue("123");

            String userId = CreatedResponseUtil.getCreatedId(response);
            UserResource userResource = usersRessource.get(userId);
            userResource.resetPassword(passwordCred);
            return true;
        } else if (response.getStatus() == 409) {
            throw new RuntimeException("Usuário já existe");
        }
        return false;
    }

    @Override
    public Optional<User> findByUsername(String username) {
        var usersRepresentation = usersRessource.search(username);
        if (usersRepresentation.isEmpty()) {
            return Optional.empty();
        }
        var userRepresentation = usersRepresentation.get(0);

        var user = MAPPER.map(userRepresentation);
        return Optional.of(user);
    }

    @Override
    public boolean existsByUsername(String username) {
        var usersRepresentation = usersRessource.search(username);
        return !usersRepresentation.isEmpty();
    }

    private UserRepresentation getByUsername(String username) {
        var usersRepresentation = usersRessource.search(username);
        if (usersRepresentation.isEmpty()) {
            throw new RuntimeException("Usuário não existe");
        }
        return usersRepresentation.get(0);
    }

    @Override
    public void setGroups(String username, List<String> groupsPath) {
        var user = getByUsername(username);
        user.setGroups(groupsPath);
    }

    @Override
    public void addGroups(String username, List<String> groupsPath) {
        var user = getByUsername(username);
        if (Objects.nonNull(user.getGroups()) && !user.getGroups().isEmpty()) {
            groupsPath.addAll(user.getGroups());
        }
        user.setGroups(groupsPath);
    }

    /*private GroupResource getGroupResource(String group) {
        var groups = groupsResource.groups(
                group,
                0,
                1
        );

        if (groups.isEmpty()) {
            throw new RuntimeException("Grupo não encontrado");
        }

        var firstGroup = groups.get(0);
        return groupsResource.group(firstGroup.getId());
    }

    private List<String> getSubGroupsPath(String group, List<String> subGroups) {
        var subGroupsPath = getGroupResource(group)
                .toRepresentation()
                .getSubGroups()
                .stream()
                .filter(it -> subGroups.contains(it.getName()))
                .map(GroupRepresentation::getPath)
                .toList();

        if (subGroupsPath.isEmpty()) {
            throw new RuntimeException("Subgrupo não encontrado");
        }

        return subGroupsPath;
    }*/

}
