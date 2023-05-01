package com.fluytcloud.core.functions;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.function.Consumer;

@FunctionalInterface
public interface ThrowingConsummer<T, E extends Exception> {

    Logger LOGGER = LoggerFactory.getLogger(ThrowingConsummer.class.getName());

    void accept(T t) throws E;

    static <T, E extends Exception> Consumer<T> handlingConsumerWrapper(
            ThrowingConsummer<T, E> throwingConsummer, Class<E> exceptionClass
    ) {
        return i -> {
          try {
              throwingConsummer.accept(i);
          } catch (Exception ex) {
              try {
                  E exCast = exceptionClass.cast(ex);
                  LOGGER.error("Exception occured", exCast);
                  throw new ThrowingWrapperFunctionalException(ex);
              } catch (ClassCastException ccEx) {
                  throw new ThrowingWrapperFunctionalException(ex);
              }
          }
        };
    }


}
