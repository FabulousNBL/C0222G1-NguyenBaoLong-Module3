package service.serviceFurama.impl;

import model.service.ServiceType;
import repository.service.impl.ServiceTypeRepoImpl;
import service.serviceFurama.ServiceTypeService;

import java.util.List;

public class ServiceTypeImpl implements ServiceTypeService {
    ServiceTypeRepoImpl serviceTypeRepo= new ServiceTypeRepoImpl();

    @Override
    public List<ServiceType> findAll() {
        return serviceTypeRepo.findAll();
    }
}
