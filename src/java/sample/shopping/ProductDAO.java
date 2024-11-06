/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.shopping;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import sample.utils.DBUtils;

/**
 *
 * @author LENOVO
 */
public class ProductDAO {

    private static final String LIST_PRODUCT = "SELECT productID, name, price, quantity, img FROM products";
    private static final String LIST_4_PRODUCT = "SELECT TOP 4 productID, name, price, quantity, img FROM products";
    private static final String LIST_ANOTHER_PRODUCT_EXCEPT = "SELECT TOP 4 productID, name, price, quantity, img FROM products WHERE productID != ?";
    private static final String GET_BY_ID = "SELECT name, price, quantity, img FROM products WHERE productID = ?";
    private static final String UPDATE = "UPDATE products SET quantity = ? WHERE productID = ?";

    public List<Products> getAll() throws SQLException, ClassNotFoundException {
        List<Products> listProduct = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ps = conn.prepareStatement(LIST_PRODUCT);
                rs = ps.executeQuery();
                while (rs.next()) {
                    String productID = rs.getString("productID");
                    String name = rs.getString("name");
                    double price = rs.getDouble("price");
                    int quantity = rs.getInt("quantity");
                    String img = rs.getString("img");
                    listProduct.add(new Products(productID, name, price, quantity, img));
                }
            }
        } finally {
            if (rs != null) {
                conn.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                rs.close();
            }
        }
        return listProduct;
    }

    public List<Products> getFourProducts() throws SQLException, ClassNotFoundException {
        List<Products> listProduct = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ps = conn.prepareStatement(LIST_4_PRODUCT);
                rs = ps.executeQuery();
                while (rs.next()) {
                    String productID = rs.getString("productID");
                    String name = rs.getString("name");
                    double price = rs.getDouble("price");
                    int quantity = rs.getInt("quantity");
                    String img = rs.getString("img");
                    listProduct.add(new Products(productID, name, price, quantity, img));
                }
            }
        } finally {
            if (rs != null) {
                conn.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                rs.close();
            }
        }
        return listProduct;
    }

    public List<Products> getAnotherProductExcept(String productid) throws SQLException, ClassNotFoundException {
        List<Products> listProduct = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ps = conn.prepareStatement(LIST_ANOTHER_PRODUCT_EXCEPT);
                ps.setString(1, productid);
                rs = ps.executeQuery();
                while (rs.next()) {
                    String productID = rs.getString("productID");
                    String name = rs.getString("name");
                    double price = rs.getDouble("price");
                    int quantity = rs.getInt("quantity");
                    String img = rs.getString("img");
                    listProduct.add(new Products(productID, name, price, quantity, img));
                }
            }
        } finally {
            if (rs != null) {
                conn.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                rs.close();
            }
        }
        return listProduct;
    }

    public Products getByID(String id) throws SQLException, ClassNotFoundException {
        Products p = null;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ps = conn.prepareStatement(GET_BY_ID);
                ps.setString(1, id);
                rs = ps.executeQuery();
                while (rs.next()) {
                    String name = rs.getString("name");
                    double price = rs.getDouble("price");
                    int quantity = rs.getInt("quantity");
                    String img = rs.getString("img");
                    p = new Products(id, name, price, quantity, img);
                }
            }
        } finally {
            if (rs != null) {
                conn.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                rs.close();
            }
        }
        return p;
    }

    public void updateQuantity(Cart cart) throws ClassNotFoundException, SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                for (Products product : cart.getCart().values()) {
                    ps = conn.prepareStatement(UPDATE);
                    // Lấy product dưới kho theo id
                    Products p = getByID(product.getProductID());
                    ps.setInt(1, p.getQuantity() - product.getQuantity());
                    ps.setString(2, product.getProductID());
                    ps.executeUpdate();
                }
            }
        } finally {
            if (ps != null) {
                conn.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }

    public List<Products> getListByPage(List<Products> list, int start, int end) {
        ArrayList<Products> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }
}
