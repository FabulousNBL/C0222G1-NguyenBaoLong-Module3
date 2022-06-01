package repository;

import model.User;

import java.util.List;

public interface IUserRepo {
    List<User>findAll();
    User findByCountry();
    void save(User user);
    boolean delete(int id);
    void update(int id, User user);
}
