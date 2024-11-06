/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.shopping;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author LENOVO
 */
public class Cart {
    private Map<String, Products> cart;

    public Cart() {
    }

    public Cart(Map<String, Products> cart) {
        this.cart = cart;
    }

    public Map<String, Products> getCart() {
        return cart;
    }

    public void setCart(Map<String, Products> cart) {
        this.cart = cart;
    }

    public boolean add(Products product) {
        boolean check = false;
        try {
            if(this.cart == null) {
                this.cart = new HashMap<>();
            }
            if(this.cart.containsKey(product.getProductID())) {
                int currentQuantity = this.cart.get(product.getProductID()).getQuantity();
                product.setQuantity(currentQuantity + product.getQuantity());
            }
            this.cart.put(product.getProductID(), product);
            check = true;
        } catch (Exception e) {
        }
        return check;
    }

    public boolean remove(String id) {
        boolean check = false;
        try {
            if(this.cart!=null){
                if(this.cart.containsKey(id)){
                    this.cart.remove(id);
                    check = true;
                }
            }
        } catch (Exception e) {
        }
        return check;
    }
    
    public boolean edit(String id, int quantity) {
        boolean check = false;
        try {
            if(this.cart!=null){
                if(this.cart.containsKey(id)){
                    Products product = this.cart.get(id);
                    product.setQuantity(quantity);
                    this.cart.replace(id, product);
                    this.cart.get(id).setQuantity(quantity);
                    check = true;
                }
            }
        } catch (Exception e) {
        }
        return check;
    }
    
    public double getTotal(){
        double total = 0;
        for(Products product: this.getCart().values()){
            total +=  product.getPrice() * product.getQuantity();
        }
        return total;
    }
}
