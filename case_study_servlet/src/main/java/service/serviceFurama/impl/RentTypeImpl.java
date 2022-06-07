package service.serviceFurama.impl;

import model.service.RentType;
import repository.service.impl.RentTypeRepoImpl;
import service.serviceFurama.RentTypeService;

import java.util.List;

public class RentTypeImpl implements RentTypeService {
    RentTypeRepoImpl rentTypeRepo= new RentTypeRepoImpl();
    @Override
    public List<RentType> findAll() {
        return rentTypeRepo.findAll();
    }
}
