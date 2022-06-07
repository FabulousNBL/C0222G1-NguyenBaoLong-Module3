package repository.customer;

import model.customer.Customer;

import java.util.List;

public interface CustomerRepo {
    List<Customer> findAll();
    void create(Customer customer);
    void edit(String id, Customer customer);
    void delete(String id);
    List<Customer> search(String nameSearch, String typeCustomerId);
//    Customer findById(String id);
}
