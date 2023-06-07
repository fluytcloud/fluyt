package com.fluytcloud.catalog.datasources.qute;

import com.fluytcloud.catalog.repositories.TemplateRepository;
import io.quarkus.qute.Engine;
import io.quarkus.qute.TemplateException;
import jakarta.enterprise.context.ApplicationScoped;
import org.apache.commons.lang3.StringUtils;
import org.eclipse.microprofile.config.inject.ConfigProperty;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.List;
import java.util.Map;
import java.util.function.Consumer;

@ApplicationScoped
public class QuteTemplateRepositoryImpl implements TemplateRepository {

    private static final Logger LOGGER = LoggerFactory.getLogger(QuteTemplateRepositoryImpl.class);

    private final Engine engine;
    private final List<String> ignoreFiles;

    public QuteTemplateRepositoryImpl(Engine engine, @ConfigProperty(name = "service.template.ignore") String ignoreFiles) {
        this.engine = engine;
        this.ignoreFiles = List.of(ignoreFiles.split(","));
    }

    @Override
    public void generateAll(File file, Map<String, Object> parameters, Consumer<String> warningsConsumer) {
        generateFiles(file.listFiles(), parameters, warningsConsumer);
    }

    private void generateFiles(File[] files, Map<String, Object> parameters, Consumer<String> warningsConsumer) {
        for (File file : files) {
            if (ignoreFiles.contains(file.getName())) {
                continue;
            }
            if (file.isDirectory()) {
                generateDirectory(file, parameters, warningsConsumer);
            } else {
                generateFile(file, parameters, warningsConsumer);
            }
        }
    }

    private void generateDirectory(File file, Map<String, Object> parameters, Consumer<String> warningsConsumer) {
        if (file.getName().startsWith("$")) {
            var key = file.getName().substring(1);
            var value = (String) parameters.get(key);
            if (StringUtils.isNotBlank(value)) {
                var newFolder = replaceDirectory(file, value);
                generateFiles(newFolder.listFiles(), parameters, warningsConsumer);
                return;
            }
        }
        generateFiles(file.listFiles(), parameters, warningsConsumer);
    }

    private File replaceDirectory(File file, String folder) {
        var newFolder = new File(file.getParent() + File.separator + folder.replace(".", "/"));
        newFolder.mkdirs();
        try {
            Files.move(file.toPath(), newFolder.toPath(), StandardCopyOption.REPLACE_EXISTING);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        return newFolder;
    }

    private void generateFile(File file, Map<String, Object> parameters, Consumer<String> warningsConsumer) {
        try {
            var template = engine.getTemplate(file.getAbsolutePath());
            var rendered = template.render(parameters);
            var writer = new BufferedWriter(new FileWriter(file));
            writer.write(rendered);
            writer.close();
        } catch (TemplateException e) {
            var message = e.getArguments() != null ? e.getArguments().toString() : e.getMessage();
            if (e.getCause() instanceof TemplateException cause) {
                message = cause.getArguments().toString();
            }
            LOGGER.warn("Error to render file {}: {}", file.getName(), message);
            warningsConsumer.accept(message);
        } catch (Exception e) {
            LOGGER.error("Error to generate file {}: {}", file.getName(), e.getMessage(), e);
            warningsConsumer.accept(e.getMessage());
        }
    }
}
