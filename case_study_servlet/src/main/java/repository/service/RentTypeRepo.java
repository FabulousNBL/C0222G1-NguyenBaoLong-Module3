package repository.service;

import model.service.RentType;

import java.util.List;

public interface RentTypeRepo {
    List<RentType> findAll();
}
