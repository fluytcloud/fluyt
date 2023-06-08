package com.fluytcloud.kubernetes.transport.http;

import com.fluytcloud.kubernetes.interactors.ClusterObjectsService;
import com.fluytcloud.kubernetes.interactors.StorageClassService;
import com.fluytcloud.kubernetes.transport.mapper.Mapper;
import com.fluytcloud.kubernetes.transport.mapper.StorageClassMapper;
import com.fluytcloud.kubernetes.transport.response.StorageClassResponseList;
import io.kubernetes.client.openapi.models.V1StorageClass;
import io.quarkus.security.Authenticated;
import jakarta.inject.Inject;
import jakarta.ws.rs.Path;

@Path("/api/v1/kubernetes/storage-class")
@Authenticated
public class StorageClassResource extends ClusterObjectsResource<V1StorageClass, StorageClassResponseList> {

    private static final StorageClassMapper STORAGE_CLASS_MAPPER = new StorageClassMapper();

    @Inject
    protected StorageClassService storageClassService;

    @Override
    protected ClusterObjectsService<V1StorageClass> getService() {
        return storageClassService;
    }

    @Override
    protected Mapper<V1StorageClass, StorageClassResponseList> getMapper() {
        return STORAGE_CLASS_MAPPER;
    }
}
