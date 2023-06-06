package com.fluytcloud.catalog.interactors;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.MapperFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.json.JsonMapper;
import com.fasterxml.jackson.dataformat.yaml.YAMLFactory;
import com.fluytcloud.catalog.entities.Template;
import com.fluytcloud.catalog.entities.TemplateParameter;
import com.fluytcloud.catalog.entities.TemplateStatus;
import com.fluytcloud.catalog.repositories.TemplateRepository;
import com.fluytcloud.core.interactors.ExecutorService;
import com.fluytcloud.scm.interactors.ScmService;
import jakarta.enterprise.context.ApplicationScoped;
import org.eclipse.microprofile.config.inject.ConfigProperty;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.File;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.atomic.AtomicReference;

@ApplicationScoped
public class TemplateService {

    private static final Logger LOGGER = LoggerFactory.getLogger(TemplateService.class);

    private final ScmService scmService;
    private final ObjectMapper objectMapper;
    private final String parameterFile;
    private final TemplateRepository templateRepository;
    private final TemplateStatusService templateStatusService;
    private final ExecutorService executorService;

    public TemplateService(ScmService scmService,
                           @ConfigProperty(name = "service.template.parameters.file") String parameterFile,
                           TemplateRepository templateRepository,
                           TemplateStatusService templateStatusService,
                           ExecutorService executorService) {
        this.scmService = scmService;
        this.parameterFile = parameterFile;
        this.templateRepository = templateRepository;
        this.templateStatusService = templateStatusService;
        this.executorService = executorService;
        this.objectMapper = JsonMapper.builder(new YAMLFactory()).enable(MapperFeature.ACCEPT_CASE_INSENSITIVE_ENUMS).build();
    }

    public List<TemplateParameter> getParameters(Template template) {
        var parameters = scmService.getFile(template.templateScm(), template.templateRepository(),
                template.templateBranch(), parameterFile);
        try {
            return objectMapper.readValue(parameters, new TypeReference<>() {
            });
        } catch (JsonProcessingException e) {
            throw new RuntimeException(e);
        }
    }

    public UUID generate(Template template, String repository, Map<String, Object> parameters) {
        var uuid = UUID.randomUUID();
        executorService.execute(() -> {
            var clone = new AtomicReference<File>();

            try {
                run(uuid, "Clone", "Downloading template", () ->
                        clone.set(scmService.clone(template.templateScm(), template.templateRepository(), template.templateBranch())));

                var parameterFile = new File(clone.get(), this.parameterFile);
                if (parameterFile.exists()) {
                    parameterFile.delete();
                }

                run(uuid, "Build", "Building files", () ->
                        templateRepository.generateAll(clone.get(), parameters, message ->
                                templateStatusService.create(new TemplateStatus(uuid, "Warning", false, message))));

                run(uuid, "Commit", "Saving files", () ->
                        scmService.commitAll("generated project by fluyt", clone.get()));

                run(uuid, "Repository", "Creating remote repository", () ->
                        scmService.createRepository(template.targetScm(), repository));

                run(uuid, "Push", "Pushing files", () -> {
                    scmService.addRemote(template.targetScm(), repository, "target", clone.get());
                    scmService.push(template.targetScm(), "target", template.targetBranch(), clone.get());
                });

                templateStatusService.create(new TemplateStatus(uuid, "Finish", false, "Repository successfully created"));
            } finally {
                if (clone.get() != null) {
                    clone.get().delete();
                }
            }
        });
        return uuid;
    }

    private void run(UUID uuid, String step, String message, Runnable runnable) {
        try {
            templateStatusService.create(new TemplateStatus(uuid, step, false, message));
            runnable.run();
        } catch (Exception e) {
            templateStatusService.create(new TemplateStatus(uuid, step, true, e.getMessage()));
            throw e;
        }
    }
}
