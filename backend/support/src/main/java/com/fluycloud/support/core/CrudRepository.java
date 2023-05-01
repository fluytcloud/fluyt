package com.fluycloud.support.core;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Optional;

public interface CrudRepository<T, ID> {

    Page<T> findAll(Pageable pageable);

    Optional<T> findById(ID id);

    T persist(T object);

    T update(ID id, T object);

    boolean exists(ID id);

    void delete(ID id);

    List<T> search(String search);

}
