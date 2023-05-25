package com.fluytcloud.kubernetes.config.jackson;

import io.kubernetes.client.common.KubernetesObject;
import jakarta.ws.rs.Consumes;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.WebApplicationException;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.MultivaluedMap;
import jakarta.ws.rs.ext.MessageBodyReader;
import jakarta.ws.rs.ext.MessageBodyWriter;
import jakarta.ws.rs.ext.Provider;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.annotation.Annotation;
import java.lang.reflect.Type;

import static java.nio.charset.StandardCharsets.UTF_8;

@Provider
@Produces("application/x-yaml")
@Consumes("application/x-yaml")
public class KubernetesYamlMediaTypeProvider implements MessageBodyReader<Object>, MessageBodyWriter<Object> {

    @Override
    public boolean isReadable(Class<?> clazz, Type type, Annotation[] annotations, MediaType mediaType) {
        return KubernetesObject.class.isAssignableFrom(clazz);
    }

    @Override
    public Object readFrom(Class<Object> clazz,
                           Type type,
                           Annotation[] annotations,
                           MediaType mediaType,
                           MultivaluedMap<String, String> multivaluedMap,
                           InputStream inputStream) throws IOException, WebApplicationException {

        String yaml = new String(inputStream.readAllBytes(), UTF_8);
        return KubernetesYamlSerializerDeserializer.deserializeFromYaml(yaml, clazz);
    }

    @Override
    public boolean isWriteable(Class<?> clazz, Type type, Annotation[] annotations, MediaType mediaType) {
        return KubernetesObject.class.isAssignableFrom(clazz);
    }

    @Override
    public void writeTo(Object o,
                        Class<?> clazz,
                        Type type,
                        Annotation[] annotations,
                        MediaType mediaType,
                        MultivaluedMap<String, Object> multivaluedMap,
                        OutputStream outputStream) throws IOException, WebApplicationException {

        String yaml = KubernetesYamlSerializerDeserializer.serializeToYaml(o);
        outputStream.write(yaml.getBytes(UTF_8));
    }
}
