/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.shopping;

import java.sql.Date;

/**
 *
 * @author LENOVO
 */
public class Order {
    private String orderID;
    private String userID;
    private Date date;
    private double total;
    private int status;

    public Order() {
    }

    public Order(String orderID, String userID, Date date, double total, int status) {
        this.orderID = orderID;
        this.userID = userID;
        this.date = date;
        this.total = total;
        this.status = status;
    }

    public String getOrderID() {
        return orderID;
    }

    public void setOrderID(String orderID) {
        this.orderID = orderID;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }  
    
}
