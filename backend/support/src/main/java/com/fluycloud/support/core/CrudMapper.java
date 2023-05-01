package com.fluycloud.support.core;

public interface CrudMapper<T, M> {

    T mapToEntity(M model);

    M mapToModel(T object);

}
