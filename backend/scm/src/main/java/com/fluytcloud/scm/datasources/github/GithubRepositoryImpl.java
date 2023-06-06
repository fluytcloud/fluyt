package com.fluytcloud.scm.datasources.github;

import com.fluytcloud.scm.datasources.GitRepositoryImpl;
import com.fluytcloud.scm.datasources.github.data.CreateRepositoryRequest;
import com.fluytcloud.scm.entities.Scm;
import com.fluytcloud.scm.entities.ScmType;
import com.fluytcloud.scm.repositories.ScmRepository;
import jakarta.enterprise.context.ApplicationScoped;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;
import org.eclipse.jgit.transport.CredentialsProvider;
import org.eclipse.jgit.transport.UsernamePasswordCredentialsProvider;
import org.eclipse.microprofile.rest.client.inject.RestClient;

import java.net.URI;
import java.nio.charset.StandardCharsets;

@ApplicationScoped
public class GithubRepositoryImpl extends GitRepositoryImpl implements ScmRepository {

    private static final String GITHUB_URI = "https://github.com/%s/%s.git";
    private final GithubRestClient githubRestClient;

    public GithubRepositoryImpl(@RestClient GithubRestClient githubRestClient) {
        this.githubRestClient = githubRestClient;
    }

    @Override
    public void createRepository(Scm scm, String name) {
        var request = new CreateRepositoryRequest(name, "Generated by fluyt", false);

        if (StringUtils.isNotBlank(scm.organization())) {
            githubRestClient.createOrganizationRepository(scm.organization(), scm.getBearer(), request);
        } else {
            githubRestClient.createUserRepository(scm.getBearer(), request);
        }
    }

    @Override
    public String getFile(Scm scm, String repository, String branch, String file) {
        try {
            var owner = StringUtils.defaultIfBlank(scm.organization(), scm.username());
            var response = githubRestClient.getRepositoryContent(owner, repository, file, branch, scm.getBearer());
            var url = URI.create(response.downloadUrl()).toURL();
            var con = url.openConnection();
            var in = con.getInputStream();
            return IOUtils.toString(in, StandardCharsets.UTF_8);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected CredentialsProvider getCredentialsProvider(Scm scm) {
        return new UsernamePasswordCredentialsProvider(StringUtils.defaultIfBlank(scm.organization(), scm.username()), scm.token());
    }

    @Override
    protected String getUri(Scm scm, String repository) {
        return String.format(GITHUB_URI, StringUtils.defaultIfBlank(scm.organization(), scm.username()), repository);
    }

    @Override
    public ScmType getType() {
        return ScmType.GITHUB;
    }
}