package com.fluytcloud.core.functions;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.function.Function;

@FunctionalInterface
public interface ThrowingFunction<T, R, E extends Exception> {

    Logger LOGGER = LoggerFactory.getLogger(ThrowingFunction.class.getName());

    R apply(T t) throws E;

    static <T, R, E extends Exception> Function<T, R> handlingFunctionWrapper(
            ThrowingFunction<T, R, E> throwingFunction,
            Class<E> exceptionClass) {
        return i -> {
          try {
              return throwingFunction.apply(i);
          } catch (Exception ex) {
              try {
                  E exCast = exceptionClass.cast(ex);
                  LOGGER.error("Exception occured", exCast);
                  return null;
              } catch (ClassCastException ccEx) {
                  throw new ThrowingWrapperFunctionalException(ccEx);
              }
          }
        };
    }


}
