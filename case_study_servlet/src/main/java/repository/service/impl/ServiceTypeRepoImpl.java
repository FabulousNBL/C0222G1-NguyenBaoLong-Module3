package repository.service.impl;

import model.service.ServiceType;
import repository.customer.BaseRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ServiceTypeRepoImpl implements repository.service.ServiceTypeRepo {
    public static final String SELECT="select * from service_type;";

    @Override
    public List<ServiceType> findAll() {
        List<ServiceType> typeList= new ArrayList<>();
        Connection connection= BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(SELECT);
            ResultSet resultSet= ps.executeQuery();
            while (resultSet.next()){
                String id= resultSet.getString("service_type_id");
                String name= resultSet.getString("service_type_name");

                ServiceType serviceType= new ServiceType(id,name);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }
}
