package repository.service.impl;

import model.service.RentType;
import model.service.ServiceType;
import repository.customer.BaseRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RentTypeRepoImpl implements repository.service.RentTypeRepo {
    public static final String SELECT="select * from rent_type;";

    @Override
    public List<RentType> findAll() {
        List<RentType> rentTypes= new ArrayList<>();
        Connection connection= BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(SELECT);
            ResultSet resultSet= ps.executeQuery();
            while (resultSet.next()){
                String id= resultSet.getString("rent_type_id");
                String name= resultSet.getString("rent_type_name");
                double cost= resultSet.getDouble("rent_cost");

                RentType rentType= new RentType(id,name,cost);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }
}
