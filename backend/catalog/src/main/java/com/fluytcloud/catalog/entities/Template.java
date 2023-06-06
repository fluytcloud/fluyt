package com.fluytcloud.catalog.entities;

import com.fluytcloud.scm.entities.Scm;

public record Template(
        Integer id,
        String name,
        Scm templateScm,
        String templateRepository,
        String templateBranch,
        Scm targetScm,
        String targetBranch
) {
}
