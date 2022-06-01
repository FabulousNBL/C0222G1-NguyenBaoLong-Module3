package service;

import model.User;

import java.util.List;
import java.util.Map;

public interface IUserService {
    List<User> findAll();
    boolean delete(int id);
    void save(User user);
    void edit(int id, User user);
    void update(int id, User user);
}
