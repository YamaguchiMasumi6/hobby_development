package dao;

import bean.Customer;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CustomerDAO extends DAO {
    public Customer search(String login, String password) throws SQLException {
        Customer customer = null;
        Connection con = getConnection();

        String sql = "SELECT id, login, password FROM customer WHERE login = ? AND password = ?";
        PreparedStatement st = con.prepareStatement(sql);
        st.setString(1, login);
        st.setString(2, password);
        ResultSet rs = st.executeQuery();

        if (rs.next()) {
            customer = new Customer();
            customer.setId(rs.getInt("id"));
            customer.setLogin(rs.getString("login"));
            customer.setPassword(rs.getString("password"));
        }

        rs.close();
        st.close();
        con.close();
        return customer;
    }

    public int getNextId() throws SQLException {
        Connection con = getConnection();
        String sql = "SELECT MAX(id) FROM customer";
        PreparedStatement st = con.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        int maxId = rs.next() ? rs.getInt(1) : 0;
        rs.close();
        st.close();
        con.close();
        return maxId + 1;
    }
}
