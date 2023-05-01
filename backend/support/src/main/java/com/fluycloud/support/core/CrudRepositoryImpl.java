package com.fluycloud.support.core;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public abstract class CrudRepositoryImpl<T, M, ID> implements CrudRepository<T, ID> {

    protected abstract JpaRepository<M, ID> getJpaRepository();

    protected abstract CrudMapper<T, M> getMapper();

    protected Pageable pageable = PageRequest.of(0, 20);

    @Override
    public Page<T> findAll(Pageable pageable) {
        var page = getJpaRepository().findAll(pageable);
        return new PageImpl<>(
                page.getContent()
                        .stream()
                        .map(it -> getMapper().mapToEntity(it))
                        .toList(),
                page.getPageable(),
                page.getTotalElements()
        );
    }

    @Override
    public Optional<T> findById(ID id) {
        return getJpaRepository().findById(id)
                .map(it -> getMapper().mapToEntity(it));
    }

    @Override
    public T persist(T object) {
        var model = getMapper().mapToModel(object);
        model = getJpaRepository().save(model);
        return getMapper().mapToEntity(model);
    }

    @Override
    public T update(ID id, T object) {
        var model = getMapper().mapToModel(object);
        model = getJpaRepository().save(model);
        return getMapper().mapToEntity(model);
    }

    @Override
    public boolean exists(ID id) {
        return getJpaRepository().existsById(id);
    }

    @Override
    public void delete(ID id) {
        getJpaRepository().deleteById(id);
    }

    @Override
    public List<T> search(String search) {
        throw new UnsupportedOperationException("search");
    }
}
