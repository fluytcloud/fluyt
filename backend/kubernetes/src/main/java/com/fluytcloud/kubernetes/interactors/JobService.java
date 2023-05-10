package com.fluytcloud.kubernetes.interactors;

import com.fluytcloud.kubernetes.repositories.JobRepository;
import com.fluytcloud.kubernetes.repositories.NamespaceObjectsRepository;
import io.kubernetes.client.openapi.models.V1Job;

import javax.enterprise.context.ApplicationScoped;

@ApplicationScoped
public class JobService extends NamespaceObjectsService<V1Job> implements ObjectService<V1Job>  {

    private final JobRepository jobRepository;

    public JobService(JobRepository jobRepository) {
        this.jobRepository = jobRepository;
    }

    @Override
    protected NamespaceObjectsRepository<V1Job> repository() {
        return jobRepository;
    }

}

