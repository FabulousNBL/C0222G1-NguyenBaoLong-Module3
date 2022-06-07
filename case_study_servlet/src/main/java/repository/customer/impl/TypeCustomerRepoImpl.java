package repository.customer.impl;

import model.customer.CustomerType;
import repository.customer.BaseRepository;
import repository.customer.TypeCustomerRepo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TypeCustomerRepoImpl implements TypeCustomerRepo {
    private final String SELECT_ALL ="select * from customer_type;";
    @Override
    public List<CustomerType> findAll() {

        List<CustomerType> list = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = ps.executeQuery();
            while (resultSet.next()){
                String id = resultSet.getString("id");
                String name = resultSet.getString("customer_type");
                CustomerType customerType = new CustomerType(id,name);
                list.add(customerType);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return list;
    }
}
