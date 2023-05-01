package com.fluytcloud.auth.entities;

import java.util.List;

public record Group(String name, List<Group> subGroups) {
}
