package service.employee;

import model.employee.Employee;

import java.util.List;

public interface EmployeeService {
    List<Employee> findALl();
    void create (Employee employee);
    void delete( int id);
    void edit(int id, Employee employee);
    List<Employee> search(String name, String address);
}
