package com.shopsphere.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DB {

    private static final String URL =
        "jdbc:mysql://localhost:3306/shopsphere?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=Asia/Kolkata";

    private static final String USER = "root";

    private static final String PASSWORD = "harshi";

    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new SQLException(
                "MySQL JDBC driver not found. Check mysql-connector-j in pom.xml.",
                e
            );
        }

        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}