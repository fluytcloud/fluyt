package com.fluytcloud.catalog.interactors;

import com.fluycloud.support.core.CrudRepository;
import com.fluycloud.support.core.CrudServiceImpl;
import com.fluytcloud.catalog.entities.TemplateStatus;
import com.fluytcloud.catalog.repositories.TemplateStatusRepository;
import com.fluytcloud.core.interactors.ExecutorService;
import jakarta.enterprise.context.ApplicationScoped;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import java.util.function.Consumer;

@ApplicationScoped
public class TemplateStatusService extends CrudServiceImpl<TemplateStatus, Integer> {

    private final TemplateStatusRepository repository;
    private final ExecutorService executorService;

    public TemplateStatusService(TemplateStatusRepository repository, ExecutorService executorService) {
        this.repository = repository;
        this.executorService = executorService;
    }

    @Override
    protected CrudRepository<TemplateStatus, Integer> getRepository() {
        return repository;
    }

    public List<TemplateStatus> findByUuid(UUID uuid) {
        return repository.findByUuid(uuid);
    }

    public void getGenerateStatus(UUID uuid, Consumer<TemplateStatus> consumer) {
        executorService.execute(() -> {
            var sent = new ArrayList<Integer>();
            var running = true;
            while (running) {
                List<TemplateStatus> statuses = findByUuid(uuid);
                for (TemplateStatus status : statuses) {
                    if (!sent.contains(status.hashCode())) {
                        consumer.accept(status);
                        sent.add(status.hashCode());
                    }
                    if (status.step().equals("Finish") || status.error()) {
                        running = false;
                        break;
                    }
                }
                if (running) {
                    try {
                        Thread.sleep(500);
                    } catch (InterruptedException ignore) {
                    }
                }
            }
        });
    }
}
