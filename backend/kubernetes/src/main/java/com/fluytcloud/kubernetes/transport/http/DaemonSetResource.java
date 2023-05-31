package com.fluytcloud.kubernetes.transport.http;

import com.fluytcloud.kubernetes.interactors.DaemonSetService;
import com.fluytcloud.kubernetes.interactors.NamespaceObjectsService;
import com.fluytcloud.kubernetes.transport.mapper.DaemonSetMapper;
import com.fluytcloud.kubernetes.transport.mapper.Mapper;
import com.fluytcloud.kubernetes.transport.response.DaemonSetResponseList;
import io.kubernetes.client.openapi.models.V1DaemonSet;
import io.quarkus.security.Authenticated;
import jakarta.inject.Inject;
import jakarta.ws.rs.Path;

@Path("/api/v1/kubernetes/daemon-set")
@Authenticated
public class DaemonSetResource extends NamespaceObjectsResource<V1DaemonSet, DaemonSetResponseList> {

    private static final DaemonSetMapper DAEMON_SET_MAPPER = new DaemonSetMapper();

    @Inject
    protected DaemonSetService daemonSetService;

    @Override
    protected NamespaceObjectsService<V1DaemonSet> getService() {
        return daemonSetService;
    }

    @Override
    protected Mapper<V1DaemonSet, DaemonSetResponseList> getMapper() {
        return DAEMON_SET_MAPPER;
    }
}
