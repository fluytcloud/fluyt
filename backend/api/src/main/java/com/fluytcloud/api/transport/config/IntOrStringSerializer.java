package com.fluytcloud.api.transport.config;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.SerializerProvider;
import com.fasterxml.jackson.databind.ser.std.StdSerializer;
import io.kubernetes.client.custom.IntOrString;

import java.io.IOException;
import java.util.Objects;

public class IntOrStringSerializer extends StdSerializer<IntOrString> {
    
    public IntOrStringSerializer() {
        super(IntOrString.class);
    }

    @Override
    public void serialize(IntOrString intOrString, JsonGenerator jsonGenerator, SerializerProvider serializerProvider) throws IOException {
        if (Objects.nonNull(intOrString)) {
            if (intOrString.isInteger()) {
                jsonGenerator.writeNumber(intOrString.getIntValue());
            } else {
                jsonGenerator.writeString(intOrString.getStrValue());
            }
        }
    }


}