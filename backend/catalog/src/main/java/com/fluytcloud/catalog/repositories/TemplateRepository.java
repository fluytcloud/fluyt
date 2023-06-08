package com.fluytcloud.catalog.repositories;

import java.io.File;
import java.util.Map;
import java.util.function.Consumer;

public interface TemplateRepository {

    void generateAll(File file, Map<String, Object> parameters, Consumer<String> warningsConsumer);
}
