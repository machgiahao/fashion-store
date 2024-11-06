<%-- 
    Document   : user
    Created on : May 28, 2024, 9:00:02 AM
    Author     : LENOVO
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        </style>
    </head>
    <body>
        <c:if test="${sessionScope.LOGIN_USER == null || sessionScope.LOGIN_USER.roleID ne 'US'} ">
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
                                <ul class="ms-auto d-inline-flex">
                                    <div class="flex-shrink-0 dropdown">
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
                    <a href="MainController">
                        <img class="logo" src="./img/logo1.png" alt="">
                    </a> 
                </div>
                <div class="col-md-6 d-none d-md-block pt-1 pb-2">
                    <div class="input-group pt-1 mb-0">
                        <input type="text" class="form-control border-end-0 mb-0" placeholder="Search..." aria-label="Recipient's username" aria-describedby="basic-addon2">
                        <span class="input-group-text sit border-start-0" id="basic-addon2"><i class="fa-solid fa-magnifying-glass"></i></i></span>
                    </div>
                </div>
                <div class="col-md-3 col-3 pt-1 text-end">
                    <button type="button" class="btn btn-light shadow-md border position-relative">
                        <a href="MainController?action=View" class="text-dark"><i class="fa-solid fa-bag-shopping"></i></a>
                    </button>
                    <button type="button" class="btn d-none d-md-inline-block ms-2 btn-light shadow-md border position-relative">
                        <a href="#" class="text-dark"><i class="fa-regular fa-heart"></i></a>
                    </button>
                </div>
            </div>
        </div>   
    </div>
    <div class="menu-bar container-fluid border-top bg-header">
        <div class="container">
            <header class="d-flex justify-content-center py-3">
                <ul class="nav nav-pills nav-hover">
                    <li class="nav-item"><a href="MainController" class="nav-link text-light" aria-current="page">Home</a></li>
                    <li class="nav-item"><a href="MainController?action=Shopping_Page" class="nav-link text-light">Products</a></li>
                    <li class="nav-item"><a href="#" class="nav-link text-light">Services</a></li>
                    <li class="nav-item"><a href="#" class="nav-link text-light">FAQs</a></li>
                    <li class="nav-item"><a href="#" class="nav-link text-light">About</a></li>
                </ul>
            </header>
        </div>
    </div>
</header>
<!--end header-->

<section style="background-color: #eee;">
    <div class="row p-4">
        <div class="col-lg-4">
            <div class="card mb-4 pb-5">
                <div class="card-body text-center">
                    <img src="https://s.net.vn/m4lC" alt="avatar"
                         class="rounded-circle img-fluid" style="width: 150px;">
                    <h5 class="my-3">${sessionScope.LOGIN_USER.fullName}</h5>
                    <p class="text-muted mb-1">@${sessionScope.LOGIN_USER.userID}</p>
                    <p class="text-muted mb-4">${sessionScope.LOGIN_USER.address}</p>
                </div>
            </div>
        </div>
        <div class="col-lg-8">
            <div class="card mb-4 pb-1">
                <div class="card-body">
                    <div class="row">
                        <div class="col-sm-3">
                            <p class="mb-0">Full Name</p>
                        </div>
                        <div class="col-sm-9">
                            <p class="text-muted mb-0">${sessionScope.LOGIN_USER.fullName}</p>
                        </div>
                    </div>
                    <hr>
                    <div class="row">
                        <div class="col-sm-3">
                            <p class="mb-0">Email</p>
                        </div>
                        <div class="col-sm-9">
                            <p class="text-muted mb-0">${sessionScope.LOGIN_USER.email}</p>
                        </div>
                    </div>
                    <hr>
                    <div class="row">
                        <div class="col-sm-3">
                            <p class="mb-0">Role</p>
                        </div>
                        <div class="col-sm-9">
                            <p class="text-muted mb-0">${sessionScope.LOGIN_USER.roleID}</p>
                        </div>
                    </div>
                    <hr>
                    <div class="row">
                        <div class="col-sm-3">
                            <p class="mb-0">Phone</p>
                        </div>
                        <div class="col-sm-9">
                            <p class="text-muted mb-0">${sessionScope.LOGIN_USER.phone}</p>
                        </div>
                    </div>
                    <hr>
                    <div class="row">
                        <div class="col-sm-3">
                            <p class="mb-0">Address</p>
                        </div>
                        <div class="col-sm-9">
                            <p class="text-muted mb-0">${sessionScope.LOGIN_USER.address}</p>
                        </div>
                    </div>
                    <hr>
                </div>
            </div>
        </div>
</section>
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
