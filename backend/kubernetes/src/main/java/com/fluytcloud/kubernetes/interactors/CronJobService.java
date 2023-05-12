package com.fluytcloud.kubernetes.interactors;

import com.fluytcloud.kubernetes.repositories.CronJobRepository;
import com.fluytcloud.kubernetes.repositories.NamespaceObjectsRepository;
import io.kubernetes.client.openapi.models.V1CronJob;

import jakarta.enterprise.context.ApplicationScoped;

@ApplicationScoped
public class CronJobService extends NamespaceObjectsService<V1CronJob> implements ObjectService<V1CronJob>  {

    private final CronJobRepository cronJobRepository;

    public CronJobService(CronJobRepository cronJobRepository) {
        this.cronJobRepository = cronJobRepository;
    }

    @Override
    protected NamespaceObjectsRepository<V1CronJob> repository() {
        return cronJobRepository;
    }

}

