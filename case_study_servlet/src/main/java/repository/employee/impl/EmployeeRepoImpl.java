package repository.employee.impl;

import model.employee.Employee;
import repository.customer.BaseRepository;
import repository.employee.EmployeeRepo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmployeeRepoImpl implements EmployeeRepo {
    private static final String SELECT= "select * from employee;";

    private static final String CREATE= "insert into employee (employee_name, employee_birthday, employee_id_card, " +
            "employee_salary, employee_phone, employee_email, employee_address, position_id, education_degree_id," +
            " division_id,username)values (?, ?, ?, ?, ?, ?,?, ?, ?, ?,?);";

    private static final String DELETE= "update employee set `status`= 1 where employee_id = ?;";



    @Override
    public List<Employee> findALl() {
        List<Employee> list= new ArrayList<>();
        Connection connection= BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(SELECT);
            ResultSet resultSet= ps.executeQuery();
            while (resultSet.next()){
                int id = Integer.parseInt(resultSet.getString("employee_id"));
                String name= resultSet.getString("employee_name");
                String birthday= resultSet.getString("employee_birthday");
                String cardId= resultSet.getString("employee_id_card");
                double salary= resultSet.getDouble("employee_salary");
                String phone= resultSet.getString("employee_phone");
                String email= resultSet.getString("employee_email");
                String address = resultSet.getString("employee_address");
                int positionId= resultSet.getInt("position_id");
                int degreeId= resultSet.getInt("education_degree_id");
                int divisionId= resultSet.getInt("division_id");
                String userName= resultSet.getString("username");
                int status= resultSet.getInt("status");

                Employee employee= new Employee(id,name,birthday,cardId,salary,phone,email,
                        address,positionId,degreeId,divisionId,userName,status);
                list.add(employee);


            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return list;
    }

    @Override
    public void create(Employee employee) {
        Connection connection= BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(CREATE);
            ps.setString(1,employee.getName());
            ps.setString(2,employee.getBirthday());
            ps.setString(3,employee.getCardId());
            ps.setDouble(4,employee.getSalary());
            ps.setString(5,employee.getPhone());
            ps.setString(6,employee.getEmail());
            ps.setString(7,employee.getAddress());
            ps.setInt(8,employee.getPositionId());
            ps.setInt(9,employee.getDegreeId());
            ps.setInt(10,employee.getDivisionId());
            ps.setString(11,employee.getUserName());
            ps.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public void delete(int id) {
       Connection connection= BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(DELETE);
            ps.setInt(1,id);
            ps.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    private static final String EDIT="update employee set employee_name = ?,employee_birthday=?, " +
            "employee_id_card=?,\n" +
            "employee_salary=?,employee_phone=?,employee_email=?,employee_address=?,\n" +
            "position_id=?,education_degree_id=?,division_id=?,username=?,`status`=? \n" +
            "where employee_id = ?;";

    @Override
    public void edit(int id, Employee employee) {
        Connection connection= BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(EDIT);
            ps.setString(1,employee.getName());
            ps.setString(2,employee.getBirthday());
            ps.setString(3,employee.getCardId());
            ps.setDouble(4,employee.getSalary());
            ps.setString(5,employee.getPhone());
            ps.setString(6,employee.getEmail());
            ps.setString(7,employee.getAddress());
            ps.setInt(8,employee.getPositionId());
            ps.setInt(9,employee.getDegreeId());
            ps.setInt(10,employee.getDivisionId());
            ps.setString(11,employee.getUserName());
            ps.setInt(12,employee.getStatus());
            ps.setInt(13,employee.getId());
            ps.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    private static final String SEARCH="select * from employee where employee_name like ? and employee_address like ?;";

    @Override
    public List<Employee> search(String name, String address) {
        List<Employee> employeeList= new ArrayList<>();
        Connection connection= BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(SEARCH);
            ps.setString(1,"%"+name+"%");
            ps.setString(2,"%"+address+"%");
            ResultSet resultSet=ps.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("employee_id");
                String nameEmployee = resultSet.getString("employee_name");
                String birthday = resultSet.getString("employee_birthday");
                String cardId = resultSet.getString("employee_id_card");
                double salary = resultSet.getDouble("employee_salary");
                String phone = resultSet.getString("employee_phone");
                String email = resultSet.getString("employee_email");
                String addressEmployee = resultSet.getString("employee_address");
                int positionId= resultSet.getInt("position_id");
                int degreeId= resultSet.getInt("education_degree_id");
                int divisionId= resultSet.getInt("division_id");
                String userName= resultSet.getString("username");
                int status= resultSet.getInt("status");

                Employee employee= new Employee(id,nameEmployee,birthday,cardId,salary,phone,email,addressEmployee,positionId,degreeId,divisionId,userName,status);
                employeeList.add(employee);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return employeeList;
    }
}
