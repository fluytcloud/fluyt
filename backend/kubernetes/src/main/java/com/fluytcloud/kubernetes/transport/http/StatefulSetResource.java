package com.fluytcloud.kubernetes.transport.http;

import com.fluytcloud.kubernetes.interactors.NamespaceObjectsService;
import com.fluytcloud.kubernetes.interactors.StatefulSetService;
import com.fluytcloud.kubernetes.transport.mapper.Mapper;
import com.fluytcloud.kubernetes.transport.mapper.StatefulSetMapper;
import com.fluytcloud.kubernetes.transport.response.StatefulSetResponseList;
import io.kubernetes.client.openapi.models.V1StatefulSet;
import io.quarkus.security.Authenticated;
import jakarta.inject.Inject;
import jakarta.ws.rs.Path;

@Path("/api/v1/kubernetes/stateful-set")
@Authenticated
public class StatefulSetResource extends NamespaceObjectsResource<V1StatefulSet, StatefulSetResponseList> {

    private static final StatefulSetMapper STATEFUL_SET_MAPPER = new StatefulSetMapper();

    @Inject
    protected StatefulSetService statefulSetService;

    @Override
    protected NamespaceObjectsService<V1StatefulSet> getService() {
        return statefulSetService;
    }

    @Override
    protected Mapper<V1StatefulSet, StatefulSetResponseList> getMapper() {
        return STATEFUL_SET_MAPPER;
    }
}
