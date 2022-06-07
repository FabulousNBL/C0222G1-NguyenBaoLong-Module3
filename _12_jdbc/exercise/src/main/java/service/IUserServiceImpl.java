package service;

import model.User;
import repository.IUserRepoImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class IUserServiceImpl implements IUserService{
    IUserRepoImpl userRepo= new IUserRepoImpl();

    @Override
    public List<User> findAll() {
        return userRepo.findAll();
    }

    @Override
    public void delete(int id) {
         userRepo.delete(id);
    }

    @Override
    public void save(User user) {
        userRepo.save(user);
    }

    @Override
    public void edit(int id, User user) {
        userRepo.update(id,user);
    }

    @Override
    public void update(int id, User user) {
        userRepo.update(id,user);
    }
}
