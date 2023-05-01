package com.fluytcloud.auth.repositories;

import com.fluytcloud.auth.entities.Group;

public interface GroupRepository {

    boolean create(Group group);

    boolean exists(String groupName);

    boolean exists(String groupName, String subGroupName);

    void addSubGroup(String groupName, String subGroupName);
}
