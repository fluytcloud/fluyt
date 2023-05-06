package com.fluytcloud.kubernetes.interactors;

import com.fluytcloud.kubernetes.repositories.JobRepository;
import com.fluytcloud.kubernetes.repositories.NamespaceObjectsRepository;
import io.kubernetes.client.openapi.models.V1Job;

import javax.enterprise.context.ApplicationScoped;

@ApplicationScoped
public class JobService extends NamespaceObjectsService<V1Job> implements ObjectService<V1Job>  {

    private final JobRepository JobRepository;

    public JobService(JobRepository JobRepository) {
        this.JobRepository = JobRepository;
    }

    @Override
    protected NamespaceObjectsRepository<V1Job> repository() {
        return JobRepository;
    }

}

