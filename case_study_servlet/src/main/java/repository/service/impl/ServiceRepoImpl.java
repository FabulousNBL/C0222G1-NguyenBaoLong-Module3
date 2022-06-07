package repository.service.impl;

import model.service.Service;
import repository.customer.BaseRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ServiceRepoImpl implements repository.service.ServiceRepo {
    public static final String SELECT_SERVICE= "select * from service;";
    public static final String CREATE= "insert into service (service_id,service_name,service_area,service_cost,service_max_people,\n" +
            "rent_type_id,service_type_id,standard_room,description_other_convenience,pool_area,floor_number)\n" +
            "values (?,?,?,?,?,?,?,?,?,?,?);";

    public static final String SEARCH= "select * from service where service_id like ? and rent_type_id = ? and service_type_id = ?;";
    @Override
    public List<Service> findAll() {
        List<Service> services= new ArrayList<>();
        Connection connection= BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(SELECT_SERVICE);
            ResultSet resultSet= ps.executeQuery();
            while(resultSet.next()){
                String id = resultSet.getString("service_id");
                String name= resultSet.getString("service_name");
                double area= resultSet.getDouble("service_area");
                double cost= resultSet.getDouble("service_cost");
                int maxCustomer=resultSet.getInt("service_max_people");
                int rentTypeId= resultSet.getInt("rent_type_id");
                int serviceTypeId= resultSet.getInt("service_type_id");
                String standardRoom = resultSet.getString("standard_room");
                String otherConvenience= resultSet.getString("description_other_convenience");
                double poolArea= resultSet.getDouble("pool_area");
                int floorNumber= resultSet.getInt("floor_number");
                int status= resultSet.getInt("status");

                Service service= new Service(id,name,area,cost,maxCustomer,rentTypeId,serviceTypeId,
                        standardRoom,otherConvenience,poolArea,floorNumber,status);

                services.add(service);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return services;
    }

    @Override
    public void create(Service service) {
        Connection connection= BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(CREATE);
            ps.setString(1,service.getServiceId());
            ps.setString(2,service.getServiceName());
            ps.setDouble(3,service.getServiceArea());
            ps.setDouble(4,service.getServiceCost());
            ps.setInt(5,service.getMaxCustomer());
            ps.setInt(6,service.getRentTypeId());
            ps.setInt(7,service.getServiceTypeId());
            ps.setString(8,service.getStandardRoom());
            ps.setString(9,service.getOtherService());
            ps.setDouble(10,service.getPoolArea());
            ps.setInt(11,service.getFloorNumber());

            ps.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public List<Service> search(String nameSearch, int typeServiceId, int idRentType) {
        List<Service> list= new ArrayList<>();
        Connection connection= BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement("SEARCH");
            ps.setString(1,"%"+nameSearch+"%");
            ps.setInt(2,idRentType);
            ps.setInt(3,typeServiceId);
            ResultSet resultSet= ps.executeQuery();
            while (resultSet.next()){
                String id=resultSet.getString("service_id");
                String name=resultSet.getString("service_name");
                double area= resultSet.getDouble("service_area");
                double cost= resultSet.getDouble("service_cost");
                int maxCustomer= resultSet.getInt("service_max_people");
                int rentTypeId= resultSet.getInt("rent_type_id");
                int typeId= resultSet.getInt("service_type_id");
                String standardRoom= resultSet.getString("standard_room");
                String otherService= resultSet.getString("description_other_convenience");
                double poolArea = resultSet.getDouble("pool_area");
                int floorNumber= resultSet.getInt("floor_number");
                int status= resultSet.getInt("status");

                Service service= new Service(id,name,area,cost,maxCustomer,rentTypeId,typeId,standardRoom,otherService,poolArea,floorNumber,status);
                list.add(service);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return list;
    }
}
