package com.fluytcloud.scm.datasources;

import com.fluytcloud.scm.entities.Scm;
import com.fluytcloud.scm.repositories.ScmRepository;
import org.apache.commons.lang3.StringUtils;
import org.eclipse.jgit.api.Git;
import org.eclipse.jgit.api.errors.GitAPIException;
import org.eclipse.jgit.transport.CredentialsProvider;
import org.eclipse.jgit.transport.URIish;
import org.eclipse.jgit.transport.UsernamePasswordCredentialsProvider;

import java.io.File;
import java.util.UUID;

public abstract class GitRepositoryImpl implements ScmRepository {

    protected static final String CLONES_DIR = System.getProperty("java.io.tmpdir") + File.separator + "clones" + File.separator;

    @Override
    public File clone(Scm scm, String repository, String branch) {
        var dir = new File(CLONES_DIR + UUID.randomUUID());

        try {
            dir.mkdirs();

            var git = Git.cloneRepository()
                    .setURI(getUri(scm, repository))
                    .setBranch(branch)
                    .setDirectory(dir)
                    .setCredentialsProvider(getCredentialsProvider(scm))
                    .call();

            git.close();

            return dir;
        } catch (GitAPIException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void addRemote(Scm scm, String repository, String name, File dir) {
        try {
            var git = Git.open(dir);
            git.remoteAdd().setName(name).setUri(new URIish(getUri(scm, repository))).call();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void commitAll(String message, File dir) {
        try {
            var git = Git.open(dir);
            git.add().setUpdate(true).addFilepattern(".").call();
            git.add().setUpdate(false).addFilepattern(".").call();
            git.commit().setAll(true).setMessage(message).call();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void push(Scm scm, String remote, String branch, File dir) {
        try {
            var git = Git.open(dir);

            if (StringUtils.isNotBlank(branch)) {
                git.checkout().setCreateBranch(true).setName(branch);
            }

            git.push()
                    .setRemote(remote)
                    .setCredentialsProvider(getCredentialsProvider(scm))
                    .call();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    protected abstract CredentialsProvider getCredentialsProvider(Scm scm);

    protected abstract String getUri(Scm scm, String repository);
}
