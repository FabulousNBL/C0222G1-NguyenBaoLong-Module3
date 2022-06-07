package repository.service;

import model.customer.Customer;
import model.service.Service;
import model.service.ServiceType;

import java.util.List;

public interface ServiceRepo {
    List<Service> findAll();
    void create(Service service);
    List<Service> search(String nameSearch, int typeServiceId, int idRentType);
}
