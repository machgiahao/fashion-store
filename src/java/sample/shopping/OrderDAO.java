/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.shopping;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import sample.user.UserDTO;
import sample.utils.DBUtils;

/**
 *
 * @author LENOVO
 */
public class OrderDAO {

    private static final String INSERT_ORDER = "INSERT INTO orders(userID, date, total) values(?,?,?)";
    private static final String GET_NEW_ADDED_ID = "SELECT TOP 1 orderID FROM Orders ORDER BY orderID DESC";
    private static final String INSERT_ORDER_DETAIL = "INSERT INTO orderDetails(orderID, productID, price, quantity) values(?,?,?,?)";

    private static final String GET_ORDER = "SELECT orderID FROM orders WHERE userID = ?";
    private static final String DELETE_ORDER_DETAIL = "DELETE orderDetails WHERE orderID = ?";
    private static final String DELETE_ORDER = "DELETE orders WHERE userID = ?";

    public void add(UserDTO user, Cart cart) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        PreparedStatement ps1 = null;
        PreparedStatement ps2 = null;
        ResultSet rs = null;
        LocalDate date = LocalDate.now();
        Date curDate = Date.valueOf(date);
        try {
            // insert into Order table
            conn = DBUtils.getConnection();
            ps = conn.prepareStatement(INSERT_ORDER);
            ps.setString(1, user.getUserID());
            ps.setDate(2, curDate);
            ps.setDouble(3, cart.getTotal());
            ps.executeUpdate();
            // Lay ra id cua Order vua add
            ps1 = conn.prepareStatement(GET_NEW_ADDED_ID);
            rs = ps1.executeQuery();
            //insert into orderDetail
            if (rs.next()) {
                int orderID = rs.getInt("orderID");
                for (Products product : cart.getCart().values()) {
                    ps2 = conn.prepareStatement(INSERT_ORDER_DETAIL);
                    ps2.setInt(1, orderID);
                    ps2.setString(2, product.getProductID());
                    ps2.setInt(3, product.getQuantity());
                    ps2.setDouble(4, product.getPrice());
                    ps2.executeUpdate();
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
                ps1.close();
                ps2.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }

    public boolean checkDeleteOrder(String userID) throws ClassNotFoundException, SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ps = conn.prepareStatement(GET_ORDER);
                ps.setString(1, userID);
                rs = ps.executeQuery();

                while (rs.next()) {
                    String orderID = rs.getString("orderID");
                    PreparedStatement psDeleteOrderDetail = conn.prepareStatement(DELETE_ORDER_DETAIL);
                    psDeleteOrderDetail.setString(1, orderID);
                    psDeleteOrderDetail.executeUpdate();
                    psDeleteOrderDetail.close();
                }
                rs.close();
                ps.close();

                ps = conn.prepareStatement(DELETE_ORDER);
                ps.setString(1, userID);
                ps.executeUpdate();
                check = ps.executeUpdate() > 0 ? true : false;
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }
}
