<%-- 
    Document   : admin
    Created on : May 28, 2024, 9:03:17 AM
    Author     : LENOVO
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
                integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"
                integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy"
        crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/2b9cdc1c9a.js" crossorigin="anonymous"></script>
        <link href="./css/admin.css" rel="stylesheet"/>
        <link href="./css/style.css" rel="stylesheet"/>
        <title>GH STORE</title>
        <style>
            .nav-hover .nav-link:hover {
                background-color: white !important;
                color: black !important;
            }

            .shadow-md {
                box-shadow: 0 10px 15px 10px rgba(0, 0, 0, 0.07), 0 4px 6px -2px rgba(0, 0, 0, 0.05);
            }

            .fs-8 {
                font-size: 0.9rem;
            }

            .btn-bg-active {
                background-color: white !important;
                color: black !important;
            }

            a:hover{
                color: red !important;
            }

            .gvi {
                margin-top: -20px;
            }

            .quantity{
                max-width: 30%;
            }

            .error{
                color: red;
                font-weight: bold;
            }
        </style>
    </head>
    <body>
        <c:if test="${sessionScope.LOGIN_USER == null || sessionScope.LOGIN_USER.roleID ne 'AD'}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>
        <header class="container-fluid bg-white p-0">
            <div class="header-top bg-gray  border-bottom">
                <div class="container">
                    <div class="row">
                        <div class="col-md-8">
                            <ul class="d-inline-flex pt-0 pt-md-2 fs-6">
                                <li class="p-2 d-none d-md-block"><i class="fa-solid fa-envelope"></i> Support@machgiahao0979@gmail.com</li>
                                <li class="p-2 d-none d-md-block"><i class="fa-solid fa-phone"></i> +999 999 999 999</li>
                            </ul>
                        </div>
                        <div class="col-md-4 d-flex align-items-end">
                            <c:if test="${sessionScope.LOGIN_USER == null}" >
                                <ul class="ms-auto d-inline-flex">
                                    <li class="p-2 d-none d-md-block"><a href="MainController?action=Login_Page"><button class="btn px-4 btn-outline-success">Login</button></a></li>
                                    <li class="p-2 d-none d-md-block"><a href="MainController?action=Create_Page"><button class="btn px-4 btn-success">Sign Up</button></a></li>
                                </ul>
                            </c:if>
                            <c:if test="${sessionScope.LOGIN_USER != null}" >
                                <ul class="ms-auto d-inline-flex pt-2 mb-0">    
                                    <p class="me-2 pt-2">${sessionScope.LOGIN_USER.fullName}</p>
                                    <div class="flex-shrink-0 dropdown pt-1">
                                        <a href="#" class="d-block link-body-emphasis text-decoration-none dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                                            <img src="https://s.net.vn/m4lC" alt="mdo" width="32" height="32" class="rounded-circle">
                                        </a>
                                        <ul class="dropdown-menu text-small shadow">
                                            <li><a class="dropdown-item" href="MainController?action=User_Page">Profile</a></li>
                                            <li><a class="dropdown-item" href="MainController?action=View">My order</a></li>
                                            <li><a class="dropdown-item" href="#">Settings</a></li>
                                            <li><hr class="dropdown-divider"></li>
                                                <c:url var="Logout" value="MainController">
                                                    <c:param name="action" value="Logout"></c:param>
                                                </c:url>
                                            <li><a class="dropdown-item" href="${Logout}">Sign out</a></li>
                                        </ul>
                                </ul>
                            </div>
                        </div>
                    </c:if>                           
                </div>
            </div>
        </div>
    </div>
    <div class="logo-contaienr p-2">
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-9 pt-1 pb-2">
                    <a href="index.jsp">
                        <img class="logo" src="./img/logo1.png" alt="">
                    </a> 
                </div>
                <div class="col-md-6 d-none d-md-block pt-1 pb-2">
                    <form action="MainController" method="POST">
                        <div class="input-group pt-1 mb-0">
                            <input type="text" name="search" class="form-control border-end-0 mb-0" placeholder="Search..." aria-label="Search" aria-describedby="search-button" name="search" value="${param.search}">
                            <button class="btn btn-outline-secondary" type="submit" name="action" value="Search" id="search-button">
                                <i class="fa-solid fa-magnifying-glass"></i>
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>   
    </div>
    <div class="menu-bar container-fluid border-top bg-header">
        <div class="container">
            <header class="d-flex justify-content-center py-3">
                <ul class="nav nav-pills nav-hover">
                    <li class="nav-item"><a href="MainController" class="nav-link text-light" aria-current="page">Home</a></li>
                    <li class="nav-item"><a href="MainController?action=Shopping_page" class="nav-link text-light">Products</a></li>
                    <li class="nav-item"><a href="MainController?action=Search" class="nav-link text-light btn-bg-active">Services</a></li>
                    <li class="nav-item"><a href="#" class="nav-link text-light">FAQs</a></li>
                    <li class="nav-item"><a href="#" class="nav-link text-light">About</a></li>
                </ul>
            </header>
        </div>
    </div>
</header>
<!-- end header -->

<!--list user-->
<div class="container-xl">
    <div class="table-responsive">
        <div class="table-wrapper">
            <div class="table-title">
                <div class="row">
                    <div class="col-sm-5">
                        <h2><b>User Management</b></h2>
                    </div>
                    <div class="col-sm-7">
                        <a href="MainController?action=Create" class="btn btn-secondary"><i class="fa-solid fa-circle-plus"></i><span> Add New User</span></a>
                    </div>
                </div>
            </div>
            <c:if test="${requestScope.LIST_USER != null}">
                <c:if test="${not empty requestScope.LIST_USER}">
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Name</th>						
                                <th>RoleID</th>
                                <th>Email</th>
                                <th>Phone</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="user" varStatus="counter" items="${requestScope.LIST_USER}">
                            <form action="MainController" method="POST">
                                <c:if test="${requestScope.ERROR_EMAIL[user.userID] != null}">
                                    <tr>
                                        <td></td>
                                        <td colspan="5">
                                            <label class="error">${requestScope.ERROR_EMAIL[user.userID]}</label>
                                        </td>
                                    </tr>
                                </c:if>
                                <tr>
                                    <td>${counter.count}</td>
                                <input type="hidden" name="userID" value="${user.userID}"/>
                                <td>
                                    <input type="text" name="fullName" value="${user.fullName}" required=""/>
                                </td>
                                <td>
                                    <select id="cars"name="roleID">
                                        <option value="${user.roleID}">${user.roleID}</option>
                                        <c:if test="${user.roleID ne 'US'}">
                                            <option value="US">US</option>   
                                        </c:if> 
                                        <c:if test="${user.roleID ne 'AD'}"> 
                                            <option value="AD">AD</option>   
                                        </c:if> 
                                    </select>
                                </td>                        
                                <td>
                                    <input type="text" name="email" value="${user.email}" required=""/>
                                </td>
                                <td>
                                    <input type="text" name="phone" value="${user.phone}" required=""/>
                                </td>
                                <td class="pb-1">
                                    <input type="hidden" name="search" value="${param.search}"/>
                                    <button class="btn p-0 mb-1" type="submit" name="action" value="Update">
                                        <i class="fa-regular fa-pen-to-square" style="color: #74C0FC;"></i>
                                    </button>
                                    <c:url var="deleteLink" value="MainController">
                                        <c:param name="action" value="Delete"></c:param>
                                        <c:param name="userID" value="${user.userID}"></c:param>
                                        <c:param name="search" value="${param.search}"></c:param>
                                    </c:url>
                                    <a href="${deleteLink}" class="" title="Delete" data-toggle="tooltip"><i class="fa-solid fa-circle-xmark" style="color: #e81717;"></i></a>
                                </td>
                                </tr>
                            </form>
                        </c:forEach>
                        </tbody>
                    </table>
                </c:if>
            </c:if>     
        </div>
    </div>
</div>
<!--Footer-->
<footer class="py-5 w-100 p-5 bg-secondary">
    <div class="row">
        <div class="col-6 col-md-2 mb-3">
            <h5>Section</h5>
            <ul class="nav flex-column">
                <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-body-secondary">Home</a></li>
                <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-body-secondary">Features</a></li>
                <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-body-secondary">Pricing</a></li>
                <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-body-secondary">FAQs</a></li>
                <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-body-secondary">About</a></li>
            </ul>
        </div>

        <div class="col-6 col-md-2 mb-3">
            <h5>Section</h5>
            <ul class="nav flex-column">
                <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-body-secondary">Home</a></li>
                <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-body-secondary">Features</a></li>
                <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-body-secondary">Pricing</a></li>
                <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-body-secondary">FAQs</a></li>
                <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-body-secondary">About</a></li>
            </ul>
        </div>

        <div class="col-6 col-md-2 mb-3">
            <h5>Section</h5>
            <ul class="nav flex-column">
                <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-body-secondary">Home</a></li>
                <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-body-secondary">Features</a></li>
                <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-body-secondary">Pricing</a></li>
                <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-body-secondary">FAQs</a></li>
                <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-body-secondary">About</a></li>
            </ul>
        </div>

        <div class="col-md-5 offset-md-1 mb-3">
            <form>
                <h5>Subscribe to our newsletter</h5>
                <p>Monthly digest of what's new and exciting from us.</p>
                <div class="d-flex flex-column flex-sm-row w-100 gap-2">
                    <label for="newsletter1" class="visually-hidden">Email address</label>
                    <input id="newsletter1" type="text" class="form-control" placeholder="Email address">
                    <button class="btn btn-primary" type="button">Subscribe</button>
                </div>
            </form>
        </div>
    </div>
    <div class="d-flex flex-column flex-sm-row py-4 my-4 border-top justify-content-center">
        <p class="text-center">© 2024 Haomg.</p>
    </div>
</footer>
<!--End Footer-->
</body>
</html>
