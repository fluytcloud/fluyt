package com.fluytcloud.auth.interactors;

import com.fluytcloud.auth.entities.Group;
import com.fluytcloud.auth.repositories.GroupRepository;

import javax.enterprise.context.ApplicationScoped;

@ApplicationScoped
public class GroupService {

    private final GroupRepository groupRepository;

    public GroupService(GroupRepository groupRepository) {
        this.groupRepository = groupRepository;
    }

    public boolean create(Group group) {
        return groupRepository.create(group);
    }

    public boolean exists(String groupName) {
        return groupRepository.exists(groupName);
    }

    public boolean exists(String groupName, String subGroupName) {
        return groupRepository.exists(groupName, subGroupName);
    }

    public void addSubGroup(String groupName, String subGroupName) {
        groupRepository.addSubGroup(groupName, subGroupName);
    }

}
