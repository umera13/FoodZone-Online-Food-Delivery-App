package com.food.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.food.dao.UserDAO;
import com.food.model.User;
import com.food.util.DBConnection;

public class UserDAOImpl implements UserDAO {

    private static final String INSERT_USER =
            "INSERT INTO user(name, username, password, email, phone, address, role) VALUES(?,?,?,?,?,?,?)";

    private static final String GET_USER_BY_ID =
            "SELECT * FROM user WHERE userId=?";

    private static final String GET_ALL_USERS =
            "SELECT * FROM user";

    private static final String UPDATE_USER =
            "UPDATE user SET name=?, username=?, password=?, email=?, phone=?, address=?, role=? WHERE userId=?";

    private static final String DELETE_USER =
            "DELETE FROM user WHERE userId=?";

    private static final String GET_USER_BY_USERNAME =
            "SELECT * FROM user WHERE username=?";
    private static final String LOGIN_USER =
            "SELECT * FROM user WHERE email=? AND password=?";

    private static final String CHECK_EMAIL =
            "SELECT * FROM user WHERE email=?";

    private static final String CHECK_USERNAME =
            "SELECT * FROM user WHERE username=?";

    private static final String UPDATE_LAST_LOGIN =
            "UPDATE user SET LastLoginDate=NOW() WHERE UserID=?";

 
    @Override
    public int addUser(User user) {

        try {

            Connection connection = DBConnection.getConnection();

            PreparedStatement pstmt =
                    connection.prepareStatement(INSERT_USER);

            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getUsername());
            pstmt.setString(3, user.getPassword());
            pstmt.setString(4, user.getEmail());
            pstmt.setString(5, user.getPhone());
            pstmt.setString(6, user.getAddress());
            pstmt.setString(7, user.getRole());

            return pstmt.executeUpdate();

        }
        catch (Exception e) {

            e.printStackTrace();
        }

        return 0;
    }

    @Override
    public User getUserById(int userId) {

        User user = null;

        try {

            Connection connection = DBConnection.getConnection();

            PreparedStatement pstmt =
                    connection.prepareStatement(GET_USER_BY_ID);

            pstmt.setInt(1, userId);

            ResultSet rs = pstmt.executeQuery();

            if(rs.next()) {

                user = extractUser(rs);
            }

        }
        catch(Exception e) {

            e.printStackTrace();
        }

        return user;
    }
    @Override
    public List<User> getAllUsers() {

        List<User> users = new ArrayList<>();

        try {

            Connection connection = DBConnection.getConnection();

            PreparedStatement pstmt =
                    connection.prepareStatement(GET_ALL_USERS);

            ResultSet rs = pstmt.executeQuery();

            while(rs.next()) {

                users.add(extractUser(rs));
            }

        }
        catch(Exception e) {

            e.printStackTrace();
        }

        return users;
    }
    @Override
    public boolean updateUser(User user) {

        try {

            Connection connection = DBConnection.getConnection();

            PreparedStatement pstmt =
                    connection.prepareStatement(UPDATE_USER);

            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getUsername());
            pstmt.setString(3, user.getPassword());
            pstmt.setString(4, user.getEmail());
            pstmt.setString(5, user.getPhone());
            pstmt.setString(6, user.getAddress());
            pstmt.setString(7, user.getRole());
            pstmt.setInt(8, user.getUserId());

            return pstmt.executeUpdate() > 0;

        }
        catch(Exception e) {

            e.printStackTrace();
        }

        return false;
    }
    @Override
    public boolean deleteUser(int userId) {

        try {

            Connection connection = DBConnection.getConnection();

            PreparedStatement pstmt =
                    connection.prepareStatement(DELETE_USER);

            pstmt.setInt(1, userId);

            return pstmt.executeUpdate() > 0;

        }
        catch(Exception e) {

            e.printStackTrace();
        }

        return false;
    }
    @Override
    public User getUserByUsername(String username) {

        User user = null;

        try {

            Connection connection = DBConnection.getConnection();

            PreparedStatement pstmt =
                    connection.prepareStatement(GET_USER_BY_USERNAME);

            pstmt.setString(1, username);

            ResultSet rs = pstmt.executeQuery();

            if(rs.next()) {

                user = extractUser(rs);
            }

        }
        catch(Exception e) {

            e.printStackTrace();
        }

        return user;
    }    
    @Override
    public User loginUser(String email, String password) {

        User user = null;

        try {

            Connection connection = DBConnection.getConnection();

            PreparedStatement pstmt =
                    connection.prepareStatement(LOGIN_USER);

            pstmt.setString(1, email);
            pstmt.setString(2, password);

            ResultSet rs = pstmt.executeQuery();

            if(rs.next()) {

                user = extractUser(rs);

                updateLastLogin(user.getUserId());
            }

        }
        catch(Exception e) {

            e.printStackTrace();
        }

        return user;
    }    
    @Override
    public boolean isEmailExists(String email) {

        try {

            Connection connection = DBConnection.getConnection();

            PreparedStatement pstmt =
                    connection.prepareStatement(CHECK_EMAIL);

            pstmt.setString(1, email);

            ResultSet rs = pstmt.executeQuery();

            return rs.next();

        }
        catch(Exception e) {

            e.printStackTrace();
        }

        return false;
    }    
    @Override
    public boolean isUsernameExists(String username) {

        try {

            Connection connection = DBConnection.getConnection();

            PreparedStatement pstmt =
                    connection.prepareStatement(CHECK_USERNAME);

            pstmt.setString(1, username);

            ResultSet rs = pstmt.executeQuery();

            return rs.next();

        }
        catch(Exception e) {

            e.printStackTrace();
        }

        return false;
    }    
    @Override
    public boolean updateLastLogin(int userId) {

        try {

            Connection connection = DBConnection.getConnection();

            PreparedStatement pstmt =
                    connection.prepareStatement(UPDATE_LAST_LOGIN);

            pstmt.setInt(1, userId);

            return pstmt.executeUpdate() > 0;

        }
        catch(Exception e) {

            e.printStackTrace();
        }

        return false;
    }

    private User extractUser(ResultSet rs) {

        try {

            User user = new User();

            user.setUserId(rs.getInt("UserID"));
            user.setName(rs.getString("Name"));
            user.setUsername(rs.getString("Username"));
            user.setPassword(rs.getString("Password"));
            user.setEmail(rs.getString("Email"));
            user.setPhone(rs.getString("Phone"));
            user.setAddress(rs.getString("Address"));
            user.setRole(rs.getString("Role"));

            if (rs.getTimestamp("CreatedDate") != null) {
                user.setCreatedDate(
                    rs.getTimestamp("CreatedDate").toLocalDateTime()
                );
            }

            if (rs.getTimestamp("LastLoginDate") != null) {
                user.setLastLoginDate(
                    rs.getTimestamp("LastLoginDate").toLocalDateTime()
                );
            }

            return user;

        }
        catch(Exception e) {

            e.printStackTrace();
        }

        return null;
    }
}