/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.user;

public class UserDTO {

    private String userID;
    private String fullName;
    private String password;
    private String roleID;
    private String email;
    private String phone;
    private String address;
    private String status;

    public UserDTO() {
        this.userID = "";
        this.fullName = "";
        this.password = "";
        this.roleID = "";
        this.email = "";
        this.phone = "";
        this.address = "";
        this.status = "";
    }

    public UserDTO(String userID, String fullName, String password, String roleID) {
        this.userID = userID;
        this.fullName = fullName;
        this.password = password;
        this.roleID = roleID;
    }

    public UserDTO(String userID, String fullName, String password, String roleID, String email, String phone) {
        this.userID = userID;
        this.fullName = fullName;
        this.password = password;
        this.roleID = roleID;
        this.email = email;
        this.phone = phone;
    }

    public UserDTO(String userID, String fullName, String password, String roleID, String email, String phone, String address) {
        this.userID = userID;
        this.fullName = fullName;
        this.password = password;
        this.roleID = roleID;
        this.email = email;
        this.phone = phone;
        this.address = address;
    }

    public UserDTO(String userID, String fullName, String password, String roleID, String status) {
        this.userID = userID;
        this.fullName = fullName;
        this.password = password;
        this.roleID = roleID;
        this.status = status;
    }

    public UserDTO(String userID, String fullName, String password, String roleID, String email, String phone, String address, String status) {
        this.userID = userID;
        this.fullName = fullName;
        this.password = password;
        this.roleID = roleID;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.status = status;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRoleID() {
        return roleID;
    }

    public void setRoleID(String roleID) {
        this.roleID = roleID;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

}
