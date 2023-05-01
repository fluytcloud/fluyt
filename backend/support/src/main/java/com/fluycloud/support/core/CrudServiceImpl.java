package com.fluycloud.support.core;

import com.fluycloud.support.entities.DuplicatedKeyException;
import com.fluycloud.support.entities.EntityNotFoundException;
import org.apache.commons.lang3.exception.ExceptionUtils;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Optional;

public abstract class CrudServiceImpl<T, ID> implements CrudService<T, ID> {

    protected abstract CrudRepository<T, ID> getRepository();

    public Page<T> findAll(Pageable pageable) {
        return getRepository().findAll(pageable);
    }

    public Optional<T> findById(ID id) {
        return getRepository().findById(id);
    }

    public T create(T object) {
        try {
            return getRepository().persist(object);
        } catch (Exception exception) {
            if (ExceptionUtils.getStackTrace(exception).contains("ConstraintViolationException")) {
                throw new DuplicatedKeyException("CPF/CNPJ já cadastrado");
            }
            throw exception;
        }
    }

    public T update(ID id, T object) {
        var exists = getRepository().exists(id);
        if (!exists) {
            throw new EntityNotFoundException(String.format("Entity %s not found", id));
        }

        try {
            return getRepository().update(id, object);
        } catch (Exception exception) {
            if (ExceptionUtils.getStackTrace(exception).contains("ConstraintViolationException")) {
                throw new DuplicatedKeyException("CPF/CNPJ já cadastrado");
            }
            throw exception;
        }
    }

    public void delete(ID id) {
        var exists = getRepository().exists(id);
        if (!exists) {
            throw new EntityNotFoundException(String.format("Entity %s not found", id));
        }
        getRepository().delete(id);
    }

    @Override
    public List<T> search(String search) {
        return getRepository().search(search);
    }
}
