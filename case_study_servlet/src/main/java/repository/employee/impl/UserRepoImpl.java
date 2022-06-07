package repository.employee.impl;

import model.employee.User;
import repository.customer.BaseRepository;
import repository.employee.UserRepo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class UserRepoImpl implements UserRepo {
    private static final String CREATE="INSERT into `user`\n" +
            "values\n" +
            " (?,?) ;";

    @Override
    public void create(User user) {
        Connection connection= BaseRepository.getConnectDB();
        try {
            PreparedStatement ps= connection.prepareStatement(CREATE);
            ps.setString(1,user.getUserName());
            ps.setString(2,user.getPassword());
            ps.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

    }
}
