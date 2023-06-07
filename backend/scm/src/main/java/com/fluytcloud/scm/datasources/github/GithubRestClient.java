package com.fluytcloud.scm.datasources.github;

import com.fluytcloud.scm.datasources.github.data.CreateRepositoryRequest;
import com.fluytcloud.scm.datasources.github.data.RepositoryContentResponse;
import jakarta.ws.rs.*;
import org.eclipse.microprofile.rest.client.annotation.ClientHeaderParam;
import org.eclipse.microprofile.rest.client.annotation.RegisterClientHeaders;
import org.eclipse.microprofile.rest.client.inject.RegisterRestClient;

@RegisterRestClient(configKey = "github-api")
@RegisterClientHeaders
@ClientHeaderParam(name = "Accept", value = "application/vnd.github+json")
@ClientHeaderParam(name = "X-GitHub-Api-Version", value = "2022-11-28")
public interface GithubRestClient {

    @POST
    @Path("/orgs/{org}/repos")
    void createOrganizationRepository(@PathParam("org") String org,
                                      @HeaderParam("Authorization") String token,
                                      CreateRepositoryRequest request);

    @POST
    @Path("/user/repos")
    void createUserRepository(@HeaderParam("Authorization") String token,
                              CreateRepositoryRequest request);

    @GET
    @Path("/repos/{owner}/{repo}/contents/{path}")
    RepositoryContentResponse getRepositoryContent(@PathParam("owner") String owner,
                                                   @PathParam("repo") String repo,
                                                   @PathParam("path") String path,
                                                   @QueryParam("ref") String ref,
                                                   @HeaderParam("Authorization") String token);
}
