package com.food.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    private static final String URL =
            "jdbc:mysql://localhost:3306/foodorderingdb";

    private static final String USERNAME = "root";

    private static final String PASSWORD = "root@123";

    static {

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");
        }
        catch (ClassNotFoundException e) {

            e.printStackTrace();
        }
    }

    public static Connection getConnection() {

        try {

            return DriverManager.getConnection(
                    URL,
                    USERNAME,
                    PASSWORD);
        }
        catch (Exception e) {

            e.printStackTrace();
        }

        return null;
    }
}