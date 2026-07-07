package com.food.dao;

import java.util.List;
import com.food.model.User;

public interface UserDAO {

    int addUser(User user);

    User loginUser(String email, String password);

    boolean isEmailExists(String email);

    boolean isUsernameExists(String username);

    boolean updateLastLogin(int userId);

    
    User getUserById(int userId);

    List<User> getAllUsers();

    boolean updateUser(User user);

    boolean deleteUser(int userId);

    User getUserByUsername(String username);
        
}