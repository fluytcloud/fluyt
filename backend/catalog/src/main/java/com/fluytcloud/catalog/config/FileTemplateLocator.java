package com.fluytcloud.catalog.config;

import io.quarkus.qute.EngineBuilder;
import io.quarkus.qute.TemplateLocator;
import io.quarkus.qute.Variant;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.enterprise.event.Observes;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.Reader;
import java.util.Optional;

@ApplicationScoped
public class FileTemplateLocator implements TemplateLocator {

    @Override
    public Optional<TemplateLocation> locate(String id) {
        var file = new File(id);
        if (file.exists() && file.isFile()) {
            return Optional.of(buildTemplateLocation(file));
        }
        return Optional.empty();
    }

    @Override
    public int getPriority() {
        return DEFAULT_PRIORITY - 1;
    }

    void configureEngine(@Observes EngineBuilder builder) {
        builder.addLocator(this);
    }

    private TemplateLocation buildTemplateLocation(File file) {
        return new TemplateLocation() {

            @Override
            public Reader read() {
                try {
                    return new FileReader(file);
                } catch (FileNotFoundException e) {
                    throw new RuntimeException(e);
                }
            }

            @Override
            public Optional<Variant> getVariant() {
                return Optional.empty();
            }
        };
    }
}
