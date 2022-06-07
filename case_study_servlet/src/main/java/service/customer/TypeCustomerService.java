package service.customer;

import model.customer.CustomerType;

import java.util.List;

public interface TypeCustomerService {
    List<CustomerType> findAll();
}
