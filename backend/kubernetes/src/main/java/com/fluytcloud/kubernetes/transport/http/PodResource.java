package com.fluytcloud.kubernetes.transport.http;

import com.fluytcloud.kubernetes.entities.Filter;
import com.fluytcloud.kubernetes.entities.OwnerReference;
import com.fluytcloud.kubernetes.interactors.NamespaceObjectsService;
import com.fluytcloud.kubernetes.interactors.PodService;
import com.fluytcloud.kubernetes.transport.mapper.Mapper;
import com.fluytcloud.kubernetes.transport.mapper.PodMapper;
import com.fluytcloud.kubernetes.transport.request.NamespaceObjectRequestListFilter;
import com.fluytcloud.kubernetes.transport.response.PodResponseList;
import com.fluytcloud.kubernetes.transport.response.PodSimpleResponseList;
import io.kubernetes.client.openapi.models.V1Pod;
import io.quarkus.security.Authenticated;
import jakarta.inject.Inject;
import jakarta.validation.Valid;
import jakarta.ws.rs.BeanParam;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;

import java.util.List;
import java.util.Objects;

@Path("/api/v1/kubernetes/pod")
@Authenticated
public class PodResource extends NamespaceObjectsResource<V1Pod, PodResponseList> {

    private static final PodMapper POD_MAPPER = new PodMapper();

    @Inject
    protected PodService podService;

    @Override
    protected NamespaceObjectsService<V1Pod> getService() {
        return podService;
    }

    @Override
    protected Mapper<V1Pod, PodResponseList> getMapper() {
        return POD_MAPPER;
    }

    @GET
    @Path("simple/list")
    public List<PodSimpleResponseList> getSimpleList(@BeanParam @Valid NamespaceObjectRequestListFilter requestFilter) {
        if (Objects.isNull(requestFilter.getOwners()) || requestFilter.getOwners().isEmpty()) {
            throw new IllegalArgumentException("Param Owner is required");
        }

        var cluster = clusterService.findById(requestFilter.getClusterId()).orElseThrow();
        var filter = new Filter(cluster).setNamespaces(requestFilter.getNamespaces())
                .setOwnerReference(new OwnerReference(requestFilter.getOwners()))
                .setSelector(requestFilter.getLabelSelector());
        var pods = podService.list(filter);
        return POD_MAPPER.mapSimpleResponseList(pods);
    }

}
