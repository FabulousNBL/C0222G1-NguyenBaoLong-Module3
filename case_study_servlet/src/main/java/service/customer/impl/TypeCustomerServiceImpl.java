package service.customer.impl;

import model.customer.CustomerType;
import repository.customer.impl.TypeCustomerRepoImpl;
import service.customer.TypeCustomerService;

import java.util.List;

public class TypeCustomerServiceImpl implements TypeCustomerService {
    TypeCustomerRepoImpl typeCustomerRepo=new TypeCustomerRepoImpl();
    @Override
    public List<CustomerType> findAll() {
        return typeCustomerRepo.findAll();
    }
}
