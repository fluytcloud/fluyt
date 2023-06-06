package com.fluytcloud.scm.interactors;

import com.fluytcloud.scm.entities.Scm;
import com.fluytcloud.scm.entities.ScmType;
import com.fluytcloud.scm.repositories.ScmRepository;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.enterprise.inject.Instance;

import java.io.File;
import java.util.Map;
import java.util.stream.Collectors;

@ApplicationScoped
public class ScmService {

    private final Map<ScmType, ScmRepository> repositories;

    public ScmService(Instance<ScmRepository> repositories) {
        this.repositories = repositories.stream().collect(Collectors.toMap(ScmRepository::getType, e -> e));
    }

    public void createRepository(Scm scm, String name) {
        getRepository(scm.type()).createRepository(scm, name);
    }

    public String getFile(Scm scm, String repository, String branch, String file) {
        return getRepository(scm.type()).getFile(scm, repository, branch, file);
    }

    public File clone(Scm scm, String repository, String branch) {
        return getRepository(scm.type()).clone(scm, repository, branch);
    }

    public void addRemote(Scm scm, String repository, String name, File dir) {
        getRepository(scm.type()).addRemote(scm, repository, name, dir);
    }

    public void commitAll(String message, File dir) {
        getRepository(ScmType.GITHUB).commitAll(message, dir);
    }

    public void push(Scm scm, String remote, String branch, File dir) {
        getRepository(scm.type()).push(scm, remote, branch, dir);
    }

    private ScmRepository getRepository(ScmType type) {
        return repositories.get(type);
    }
}
