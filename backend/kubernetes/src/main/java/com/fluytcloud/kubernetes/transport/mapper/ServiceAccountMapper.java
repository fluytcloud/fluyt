package com.fluytcloud.kubernetes.transport.mapper;

import com.fluytcloud.kubernetes.transport.response.ServiceAccountResponseList;
import io.kubernetes.client.openapi.models.V1ServiceAccount;

import java.util.List;

public class ServiceAccountMapper implements Mapper<V1ServiceAccount, ServiceAccountResponseList> {

    @Override
    public ServiceAccountResponseList mapResponseList(V1ServiceAccount serviceAccount) {
         return new ServiceAccountResponseList(
                 serviceAccount.getMetadata().getNamespace(),
                 serviceAccount.getMetadata().getName(),
                 KubernetesMapper.formatAge(serviceAccount.getMetadata().getCreationTimestamp())
         );
    }

    @Override
    public List<ServiceAccountResponseList> mapResponseList(List<V1ServiceAccount> serviceAccounts) {
        return serviceAccounts.stream()
                .map(this::mapResponseList)
                .toList();
    }

}
