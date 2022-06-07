package repository.customer;

import model.customer.CustomerType;

import java.util.List;

public interface TypeCustomerRepo {
    List<CustomerType> findAll();
}
