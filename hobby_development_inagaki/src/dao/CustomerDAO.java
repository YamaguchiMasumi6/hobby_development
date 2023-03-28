package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import bean.Customer;

public class CustomerDAO extends DAO {
    private static final Logger logger = LogManager.getLogger(CustomerDAO.class);

    public Customer search(String login, String password) throws SQLException {
        Customer customer = null;

        try (Connection con = getConnection()) {
            String sql = "SELECT * FROM customer WHERE login = ? AND password = ?";
            try (PreparedStatement st = con.prepareStatement(sql)) {
                st.setString(1, login);
                st.setString(2, password);
                try (ResultSet rs = st.executeQuery()) {
                    if (rs.next()) {
                        int id = rs.getInt("id");
                        String lgn = rs.getString("login");
                        String pwd = rs.getString("password");
                        customer = new Customer(id, lgn, pwd);
                    }
                }
            }
        } catch (SQLException e) {
            logger.error("An error occurred while executing SQL statement.", e);
            throw new SQLException("An error occurred while executing SQL statement. Please contact support.");
        }
        
        return customer;
    }

    protected Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new SQLException("JDBC Driver is not found.");
        }
        String url = "http://localhost:8003/phpMyAdmin5/namepass";
        String user = "username";
        String pass = "password";
        Connection con = DriverManager.getConnection(url, user, pass);
        return con;
    }
}
