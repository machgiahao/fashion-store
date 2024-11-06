/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.shopping;

/**
 *
 * @author LENOVO
 */
public class Products {
    private String productID;
    private String name;
    private double price;
    private int quantity;
    private int status;
    private String img;

    public Products() {
    }
    
    public Products(String productID, String name, double price, int quantity) {
        this.productID = productID;
        this.name = name;
        this.quantity = quantity;
        this.price = price;
    }

    public Products(String productID, String name, double price, int quantity, int status) {
        this.productID = productID;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.status = status;
    }

    public Products(String productID, String name, double price, int quantity, String img) {
        this.productID = productID;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.img = img;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    } 

}
