package service.employee.impl;

import model.employee.User;
import repository.employee.impl.UserRepoImpl;
import service.employee.UserService;

public class UserServiceImpl implements UserService {
    UserRepoImpl userRepo= new UserRepoImpl();

    @Override
    public void create(User user) {
        userRepo.create(user);
    }
}
