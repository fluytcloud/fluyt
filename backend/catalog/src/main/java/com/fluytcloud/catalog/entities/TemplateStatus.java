package com.fluytcloud.catalog.entities;

import java.util.UUID;

public record TemplateStatus(UUID uuid, String step, boolean error, String message) {
}
