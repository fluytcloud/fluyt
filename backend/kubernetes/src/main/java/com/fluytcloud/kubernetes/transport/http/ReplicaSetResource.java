package com.fluytcloud.kubernetes.transport.http;

import com.fluytcloud.kubernetes.entities.Filter;
import com.fluytcloud.kubernetes.entities.OwnerReference;
import com.fluytcloud.kubernetes.interactors.NamespaceObjectsService;
import com.fluytcloud.kubernetes.interactors.ReplicaSetService;
import com.fluytcloud.kubernetes.transport.mapper.Mapper;
import com.fluytcloud.kubernetes.transport.mapper.ReplicaSetMapper;
import com.fluytcloud.kubernetes.transport.request.NamespaceObjectRequestListFilter;
import com.fluytcloud.kubernetes.transport.response.ReplicaSetResponseList;
import com.fluytcloud.kubernetes.transport.response.ReplicaSetSimpleResponseList;
import io.kubernetes.client.openapi.models.V1ReplicaSet;
import io.quarkus.security.Authenticated;
import jakarta.inject.Inject;
import jakarta.validation.Valid;
import jakarta.ws.rs.BeanParam;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;

import java.util.List;
import java.util.Objects;

@Path("/api/v1/kubernetes/replica-set")
@Authenticated
public class ReplicaSetResource extends NamespaceObjectsResource<V1ReplicaSet, ReplicaSetResponseList> {

    private static final ReplicaSetMapper REPLICA_SET_MAPPER = new ReplicaSetMapper();

    @Inject
    protected ReplicaSetService replicaSetService;

    @Override
    protected NamespaceObjectsService<V1ReplicaSet> getService() {
        return replicaSetService;
    }

    @Override
    protected Mapper<V1ReplicaSet, ReplicaSetResponseList> getMapper() {
        return REPLICA_SET_MAPPER;
    }

    @GET
    @Path("simple/list")
    public List<ReplicaSetSimpleResponseList> getSimpleList(@BeanParam @Valid NamespaceObjectRequestListFilter requestFilter) {
        if (Objects.isNull(requestFilter.getOwners()) || requestFilter.getOwners().isEmpty()) {
            throw new IllegalArgumentException("Param Owner is required");
        }

        var cluster = clusterService.findById(requestFilter.getClusterId()).orElseThrow();
        var filter = new Filter(cluster)
                .setNamespaces(requestFilter.getNamespaces())
                .setOwnerReference(new OwnerReference(requestFilter.getOwners()))
                .setSelector(requestFilter.getLabelSelector());
        var replicaSets = replicaSetService.list(filter);
        return REPLICA_SET_MAPPER.mapSimpleResponseList(replicaSets);
    }

}
