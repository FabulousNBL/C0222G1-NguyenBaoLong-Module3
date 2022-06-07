package repository.customer.impl;

import model.customer.Customer;
import repository.customer.BaseRepository;
import repository.customer.CustomerRepo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepoImpl implements CustomerRepo {
    public static final String SELECT_ALL="select * from customer;";
    public static final String FIND_BY_ID="select * from customer where id = ?;";
    public static final String CREATE="insert into customer(id,type_id,`name`,birthday,gender,id_card,phone,email,address)" +
            "values (?,?,?,?,?,?,?,?,?);";
    public static final String EDIT= "update customer set type_id = ?,`name`=?,birthday=?,gender=?,id_card=?," +
            "phone=?,email=?,address=?,`status`=? where id=?;";
    public static final String DELETE="update customer set `status`= 1 where id like ?;";

    private final String SEARCH ="select * from customer where `name` like ? and type_id like ?;";

    @Override
    public List<Customer> findAll() {
        List<Customer>customers= new ArrayList<>();
        Connection connection= BaseRepository.getConnectDB();
        try {
            PreparedStatement ps=connection.prepareStatement(SELECT_ALL);
            ResultSet rs= ps.executeQuery();
            while (rs.next()){
                String id= rs.getString("id");
                String typeId= rs.getString("type_id");
                String name= rs.getString("name");
                String birthday= rs.getString("birthday");
                int gender= rs.getInt("gender");
                String idCard= rs.getString("id_card");
                String phone= rs.getString("phone");
                String email= rs.getString("email");
                String address= rs.getString("address");
                int status= rs.getInt("status");

                Customer customer= new Customer(id,typeId,name,birthday,gender,idCard,phone,email,address,status);
                customers.add(customer);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return customers;
    }

    @Override
    public void create(Customer customer) {

        Connection connection=BaseRepository.getConnectDB();


        try {
            PreparedStatement ps= connection.prepareStatement(CREATE);
            ps.setString(1,customer.getId());
            ps.setString(2,customer.getTypeId());
            ps.setString(3,customer.getName());
            ps.setString(4,customer.getBirthday());
            ps.setInt(5,customer.getGender());
            ps.setString(6,customer.getIdCard());
            ps.setString(7,customer.getPhone());
            ps.setString(8,customer.getEmail());
            ps.setString(9,customer.getAddress());
            ps.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

    }

    @Override
    public void edit(String id, Customer customer) {
        Connection connection=BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(EDIT);

            ps.setString(1,customer.getTypeId());
            ps.setString(2,customer.getName());
            ps.setString(3,customer.getBirthday());
            ps.setInt(4,customer.getGender());
            ps.setString(5,customer.getIdCard());
            ps.setString(6,customer.getPhone());
            ps.setString(7,customer.getEmail());
            ps.setString(8,customer.getAddress());
            ps.setInt(9,customer.getStatus());
            ps.setString(10,customer.getId());
            ps.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public void delete(String id) {
        Connection connection=BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(DELETE);
            ps.setString(1,"%"+id+"%");
            ps.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public List<Customer> search(String nameSearch,String typeCustomerId) {
        List<Customer> list= new ArrayList<>();
        Connection connection= BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(SEARCH);
            ps.setString(1,"%"+nameSearch+"%");
            ps.setString(2,"%"+typeCustomerId+"%");
            ResultSet resultSet=ps.executeQuery();
            while (resultSet.next()){
                String id= resultSet.getString("id");
                String typeId= resultSet.getString("type_id");
                String name= resultSet.getString("name");
                String birthday = resultSet.getString("birthday");
                int gender= resultSet.getInt("gender");
                String idCard= resultSet.getString("id_card");
                String phone=resultSet.getString("phone");
                String email=resultSet.getString("email");
                String address=resultSet.getString("address");
                int status= resultSet.getInt("status");

                Customer customer= new Customer(id,typeId,name,birthday,gender,idCard,phone,email,address,status);
                list.add(customer);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return list;
    }

//    @Override
//    public Customer findById(String id) {
//            Connection connection = BaseRepository.getConnectDB();
//            Customer customer = null;
//            try {
//                PreparedStatement ps = connection.prepareStatement(FIND_BY_ID);
//                ps.setString(1, id);
//                ResultSet resultSet = ps.executeQuery();
//
//                while (resultSet.next()) {
//                    String typeId= resultSet.getString("type_id");
//                    String name= resultSet.getString("name");
//                    String birthday = resultSet.getString("birthday");
//                    int gender= resultSet.getInt("gender");
//                    String idCard= resultSet.getString("id_card");
//                    String phone=resultSet.getString("phone");
//                    String email=resultSet.getString("email");
//                    String address=resultSet.getString("address");
//                    int status= resultSet.getInt("status");
//                    customer = new Customer(id,typeId,name,birthday,gender,idCard,phone,email,address,status);
//                }
//            } catch (SQLException throwables) {
//                throwables.printStackTrace();
//            }
//            return customer;
//        }
    }

