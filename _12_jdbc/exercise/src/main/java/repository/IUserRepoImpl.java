package repository;

import model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class IUserRepoImpl implements IUserRepo {
    private final String SELECT_ALL="select * from users order by `name`";
//    private final String INSERT_USER="insert into user(`name`,email,country) values (?,?,?);";
    private final String DELETE="delete from users where id = ?";
    private final String INSERT="insert into users(`name`,email,country) values (?,?,?);";
    private final String EDIT="update users set `name`= ?,email=?,country=? where id= ?;";
    public static List<User>userList=new ArrayList<>();

    @Override
    public List<User> findAll() {
        List<User> users= new ArrayList<>();
        Connection connection= BaseRepository.getConnectDB();
        try{
            PreparedStatement ps=connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet=ps.executeQuery();
            while (resultSet.next()){
                int id= resultSet.getInt("id");
                String name= resultSet.getString("name");
                String email= resultSet.getString("email");
                String country= resultSet.getString("country");
                int status= Integer.parseInt(resultSet.getString("status"));
                User user= new User(id,name,email,country,status);
                users.add(user);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return users;
    }

    @Override
    public boolean delete(int id) {
        boolean rowDelete = false;

        try( Connection connection=BaseRepository.getConnectDB();
             PreparedStatement ps= connection.prepareStatement(DELETE);)
        {

            ps.setInt(1,id);
            rowDelete= ps.executeUpdate()>0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return rowDelete;
    }

    @Override
    public void save(User user) {
        String query = "";
        Connection connection=BaseRepository.getConnectDB();
        try {
            PreparedStatement ps= connection.prepareStatement(INSERT);
            ps.setString(1,user.getName());
            ps.setString(2,user.getEmail());
            ps.setString(3,user.getCountry());
           ps.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public void update(int id, User user) {
        Connection connection= BaseRepository.getConnectDB();
        try {
            PreparedStatement ps= connection.prepareStatement(EDIT);
            ps.setString(1,user.getName());
            ps.setString(2,user.getEmail());
            ps.setString(3,user.getCountry());
            ps.setInt(4,user.getId());
            ps.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public User findByCountry() {
        Connection connection= BaseRepository.getConnectDB();

        return null;
    }
}
