package com.fluytcloud.scm.repositories;

import com.fluytcloud.scm.entities.Scm;
import com.fluytcloud.scm.entities.ScmType;

import java.io.File;

public interface ScmRepository {

    void createRepository(Scm scm, String name);

    String getFile(Scm scm, String repository, String branch, String file);

    File clone(Scm scm, String repository, String branch);

    void addRemote(Scm scm, String repository, String name, File dir);

    void commitAll(String message, File dir);

    void push(Scm scm, String remote, String branch, File dir);

    ScmType getType();
}
