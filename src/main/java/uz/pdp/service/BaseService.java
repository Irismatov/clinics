package uz.pdp.service;

import uz.pdp.entity.BaseEntity;
import uz.pdp.repository.BaseRepository;

import java.util.UUID;

public abstract class BaseService <T extends BaseEntity, R extends BaseRepository<T>> {
    protected R repository;

    public BaseService(R repository) {
        this.repository = repository;
    }

    public T save(T entity) {
        return repository.save(entity);
    }

    public T update(T entity) {
        return repository.save(entity);
    }

    public void delete(UUID id) {
        repository.delete(id);
    }

    public T findById(UUID id) {
        return repository.findById(id);
    }
}
