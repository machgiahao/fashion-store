<%-- 
    Document   : viewCart
    Created on : Jun 14, 2024, 8:33:29 AM
    Author     : LENOVO
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="sample.shopping.Products"%>
<%@page import="sample.user.UserDTO"%>
<%@page import="sample.shopping.Cart"%>
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
        <link href="./css/viewCart.css" rel="stylesheet"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/5.3.45/css/materialdesignicons.css" integrity="sha256-NAxhqDvtY0l4xn+YVa6WjAcmd94NNfttjNsDmNatFVc=" crossorigin="anonymous" />
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
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
        <c:if test="${sessionScope.LOGIN_USER == null || sessionScope.LOGIN_USER.roleID ne 'US'}">
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
<!-- end header -->

<!--content-->
<div class="container mt-3">
    <div class="row">
        <div class="col-xl-8">
            <c:if test="${sessionScope.CART != null}">
                <c:set var="sum" value="0.0" scope="page"/>           
                <c:forEach var="product" varStatus="counter" items="${sessionScope.CART.cart}">
                    <form action="MainController" method="POST">
                        <div class="card border shadow-none">
                            <div class="card-body">
                                <div class="d-flex align-items-start border-bottom pb-3">
                                    <div class="me-4">
                                        <a href="MainController?action=viewDetail&productID=${product.value.productID}">
                                            <img src="${product.value.img}" alt="" class="avatar-lg rounded">
                                        </a>
                                    </div>
                                    <div class="flex-grow-1 align-self-center overflow-hidden">
                                        <div>
                                            <c:if test="${requestScope.ERROR_MAP[product.value.productID] != null}">
                                                <h5 class="text-truncate font-size-18 text-danger">${requestScope.ERROR_MAP[product.value.productID]}</h5>
                                            </c:if>
                                            <h5 class="text-truncate font-size-18"><a href="MainController?action=viewDetail&productID=${product.value.productID}" class="text-dark">${product.value.name} </a></h5>
                                            <p class="text-muted mb-0">
                                                <i class="bx bxs-star text-warning"></i>
                                                <i class="bx bxs-star text-warning"></i>
                                                <i class="bx bxs-star text-warning"></i>
                                                <i class="bx bxs-star text-warning"></i>
                                                <i class="bx bxs-star-half text-warning"></i>
                                            </p>
                                            <p class="mb-0 mt-1">ProductID : <span class="fw-medium">${product.value.productID}</span></p>
                                        </div>
                                    </div>
                                    <div class="flex-shrink-0 ms-2">
                                        <ul class="list-inline mb-0 font-size-16">
                                            <li class="list-inline-item">
                                                <a href="MainController?action=Remove&id=${product.value.productID}" class="text-muted px-1">
                                                    <i class="mdi mdi-trash-can-outline"></i>
                                                </a>
                                            </li>
                                            <li class="list-inline-item">
                                                <input type="hidden" name="id" value="${product.value.productID}"/>
                                                <button class="btn border-0 px-1 pb-3" type="submit" name="action" value="Edit">
                                                    <i class="fa-solid fa-download"></i>
                                                </button>
                                            </li>
                                        </ul>
                                    </div>
                                </div>

                                <div>
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="mt-3">
                                                <p class="text-muted mb-2">Price</p>
                                                <h5 class="mb-0 mt-2"><span class="text-muted me-2"></span>$${product.value.price}</h5>
                                            </div>
                                        </div>
                                        <div class="col-md-5">
                                            <div class="mt-3">
                                                <p class="text-muted mb-2">Quantity</p>
                                                <div class="d-inline-flex">
                                                    <input type="number" name="quantity" value="${product.value.quantity}" required="" min="1"/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="mt-3">
                                                <p class="text-muted mb-2">Total</p>
                                                <h5>$${product.value.quantity * product.value.price}</h5>
                                            </div>
                                            <c:set var="sum" value="${sum + (product.value.quantity * product.value.price)}" scope="page"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                    <!-- end card -->
                </c:forEach>
            </c:if>
            <h3 class="text-center" style="color: red">${requestScope.ERROR_MESSAGE}</h3></br>
            <div class="row my-4">
                <div class="col-sm-6">
                    <a href="MainController?action=Shopping_Page" class="btn btn-link text-muted">
                        <i class="mdi mdi-arrow-left me-1"></i> Continue Shopping </a>
                </div> <!-- end col -->
            </div> <!-- end row-->
        </div>

        <div class="col-xl-4">
            <div class="mt-5 mt-lg-0">
                <div class="card border shadow-none">
                    <div class="card-header bg-transparent border-bottom py-3 px-4">
                        <h5 class="font-size-16 mb-0">Order Summary <span class="float-end">###</span></h5>
                    </div>
                    <div class="card-body p-4 pt-2">

                        <div class="table-responsive">
                            <table class="table mb-0">
                                <tbody>
                                    <tr>
                                        <td>Sub Total :</td>
                                        <td class="text-end">$ <c:out value="${sum}"/></td>
                                    </tr>
                                    <tr>
                                        <td>Discount : </td>
                                        <td class="text-end">- $ 0</td>
                                    </tr>
                                    <tr>
                                        <td>Shipping Charge :</td>
                                        <td class="text-end">$ 0</td>
                                    </tr>
                                    <tr class="bg-light">
                                        <th>Total :</th>
                                        <td class="text-end">
                                            <span class="fw-bold">
                                                $<c:out value="${sum}"/>
                                            </span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" class="text-center border-0">
                                            <form action="MainController" method="POST"> 
                                                <button class="btn btn-success" type="submit" name="action" value="CheckOut">
                                                    <i class="mdi mdi-cart-outline me-1 no-underline"></i>Checkout
                                                </button>
                                            </form>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <!-- end table-responsive -->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- end row -->
</div>
<!--end content-->

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
