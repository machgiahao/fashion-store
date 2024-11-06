/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import sample.shopping.OrderDAO;
import sample.utils.DBUtils;

/**
 *
 * @author LENOVO
 */
public class UserDAO {

    private static final String SEARCH = "SELECT userID, fullName, password ,roleID, email, phone, address FROM users WHERE fullName LIKE ?";
    private static final String LOGIN = "SELECT fullName, roleID, email, phone, address FROM users WHERE userID = ? and password = ?";
    private static final String DELETE = "DELETE users WHERE userID = ?";
    private static final String UPDATE = "UPDATE users SET fullName=?, roleID=?, email=?, phone=? WHERE userID=?";
    private static final String CHECK_DUPLICATE = "SELECT fullName FROM users WHERE userID = ?";
    private static final String INSERT = "INSERT INTO users(userID, fullName, roleID, password, email, phone, address, status) VALUES(?,?,?,?,?,?,?,?)";
    private static final String CHECK_EMAIL = "SELECT userID, fullName, password, roleID, phone, address FROM users WHERE email = ?";
    private static final String RESET_PASSWORD = "UPDATE users SET password=? WHERE email=?";
    
    

    public UserDTO checkLogin(String userID, String password) throws SQLException, ClassNotFoundException {
        UserDTO user = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(LOGIN);
                ptm.setString(1, userID);
                ptm.setString(2, password);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    String fullName = rs.getString("fullName");
                    String roleID = rs.getString("roleID");
                    String emai = rs.getString("email");
                    String phone = rs.getString("phone");
                    String address = rs.getString("address");
                    user = new UserDTO(userID, fullName, password, roleID, emai, phone, address, "1");
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return user;
    }

    public List<UserDTO> getListUser(String search) throws SQLException, ClassNotFoundException {
        List<UserDTO> listUser = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ps = conn.prepareStatement(SEARCH);
                ps.setString(1, "%" + search + "%");
                rs = ps.executeQuery();
                while (rs.next()) {
                    String userID = rs.getString("userID");
                    String fullName = rs.getString("fullName");
                    String password = "***";
                    String roleID = rs.getString("roleID");
                    String emai = rs.getString("email");
                    String phone = rs.getString("phone");
                    String address = rs.getString("address");
                    listUser.add(new UserDTO(userID, fullName, password, roleID, emai, phone, address));
                }
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
        return listUser;
    }

    public boolean checkDelete(String userID) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                OrderDAO dao = new OrderDAO();
                dao.checkDeleteOrder(userID);
                    ps = conn.prepareStatement(DELETE);
                    ps.setString(1, userID);
                    check = ps.executeUpdate() > 0 ? true : false;
            }
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean checkUpdate(UserDTO user) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ps = conn.prepareStatement(UPDATE);
                ps.setString(1, user.getFullName());
                ps.setString(2, user.getRoleID());
                ps.setString(3, user.getEmail());
                ps.setString(4, user.getPhone());
                ps.setString(5, user.getUserID());
                check = ps.executeUpdate() > 0 ? true : false;
            }
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean checkDuplicate(String userID) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECK_DUPLICATE);
                ptm.setString(1, userID);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    check = true;
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean insert(UserDTO user) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ps = conn.prepareStatement(INSERT);
                ps.setString(1, user.getUserID());
                ps.setString(2, user.getFullName());
                ps.setString(3, user.getRoleID());
                ps.setString(4, user.getPassword());
                ps.setString(5, user.getEmail());
                ps.setString(6, user.getPhone());
                ps.setString(7, user.getAddress());
                ps.setString(8, "1");
                check = ps.executeUpdate() > 0 ? true : false;
            }
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public UserDTO checkEmail(String email) throws SQLException, ClassNotFoundException {
        UserDTO user = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECK_EMAIL);
                ptm.setString(1, email);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    String userID = rs.getString("userID");
                    String fullName = rs.getString("fullName");
                    String password = rs.getString("password");
                    String roleID = rs.getString("roleID");
                    String phone = rs.getString("phone");
                    String address = rs.getString("address");
                    user = new UserDTO(userID, fullName, password, roleID, email, phone, address, "1");
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return user;
    }

    public boolean resetPassword(String password, String email) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ps = conn.prepareStatement(RESET_PASSWORD);
                ps.setString(1, password);
                ps.setString(2, email);
                check = ps.executeUpdate() > 0 ? true : false;
            }
        } finally {
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
