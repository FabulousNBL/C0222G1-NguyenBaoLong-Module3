package service.serviceFurama.impl;

import model.service.Service;
import repository.service.impl.ServiceRepoImpl;
import service.serviceFurama.ServiceFuramaService;

import java.util.List;

public class ServiceFuramaServiceImpl implements ServiceFuramaService {
    ServiceRepoImpl serviceRepo=new ServiceRepoImpl();
    @Override
    public List<Service> findAll() {
        return serviceRepo.findAll();
    }

    @Override
    public void create(Service service) {
        serviceRepo.create(service);
    }

    @Override
    public List<Service> search(String nameSearch, int typeServiceId, int idRentType) {
        return serviceRepo.search(nameSearch,typeServiceId,idRentType);
    }
}
