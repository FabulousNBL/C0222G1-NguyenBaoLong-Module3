package service.employee.impl;

import model.employee.Employee;
import repository.employee.impl.EmployeeRepoImpl;
import service.employee.EmployeeService;

import java.util.List;

public class EmployeeServiceImpl implements EmployeeService {
    EmployeeRepoImpl employeeRepo= new EmployeeRepoImpl();

    @Override
    public List<Employee> findALl() {
        return employeeRepo.findALl();
    }

    @Override
    public void create(Employee employee) {
        employeeRepo.create(employee);
    }

    @Override
    public void delete(int id) {
        employeeRepo.delete(id);
    }

    @Override
    public void edit(int id, Employee employee) {
        employeeRepo.edit(id,employee);
    }

    @Override
    public List<Employee> search(String name, String address) {
        return employeeRepo.search(name,address);
    }
}
