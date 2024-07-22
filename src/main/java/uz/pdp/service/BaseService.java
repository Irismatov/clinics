package uz.pdp.service;
import uz.pdp.entity.BaseEntity;
import uz.pdp.repository.BaseRepository;

public abstract class BaseService<T extends BaseEntity, R extends BaseRepository<T>> {

protected R repository;
}
