package service.customer;

import model.customer.Customer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

public interface CustomerService {
    List<Customer> findAll();
    Map<String, String> create(HttpServletRequest request, HttpServletResponse response);
    void edit(String id, Customer customer);
    void delete(String id);
    List<Customer> search(String nameSearch, String typeCustomerId);
//    Customer findById(String id);
}
