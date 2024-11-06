<%-- 
    Document   : index.jsp
    Created on : Jul 3, 2024, 9:01:02 PM
    Author     : LENOVO
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <c:if test="${requestScope.LIST_FOUR_PRODUCT == null || empty requestScope.LIST_FOUR_PRODUCT}">
            <c:redirect url="/ViewController"></c:redirect>
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
                    <a href="MainController" src="./img/logo1.png" alt="">
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
                    <li class="nav-item"><a href="MainController" class="nav-link text-light btn-bg-active" aria-current="page">Home</a></li>
                    <li class="nav-item"><a href="#products" class="nav-link text-light">Products</a></li>
                    <li class="nav-item"><a href="#" class="nav-link text-light">Services</a></li>
                    <li class="nav-item"><a href="#" class="nav-link text-light">FAQs</a></li>
                    <li class="nav-item"><a href="#" class="nav-link text-light">About</a></li>
                </ul>
            </header>
        </div>
    </div>
</header>
<!-- end header -->

<!--slider-->
<div class="slider">
    <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="./img/slider/slider1.jpg" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="./img/slider/slider2.jpg" class="d-block w-100" alt="...">
            </div>

        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>
</div>
<!--end slider-->

<!--product-->
<div class="latest-products pt-5 pb-0">
    <div class="container-xl">
        <div class="section-tile row">
            <div class="col-md-10 text-center mx-auto">
                <h2 id="products">Products</h2>
            </div>
        </div>
        <div class="row mt-5">
            <c:forEach var="product" varStatus="counter" items="${requestScope.LIST_FOUR_PRODUCT}">
                <div class="col-lg-3 col-md-4 mb-4">
                    <div class="bg-white p-2 shadow-md">
                        <div class="text-center">
                            <input type="hidden" name="productID" value="${product.productID}">
                            <a href="MainController?action=viewDetail&productID=${product.productID}">
                                <img src="${product.img}" alt="">
                            </a>
                        </div>
                        <div class="detail p-2">
                            <a href="MainController?action=viewDetail&productID=${product.productID}" style="text-decoration: none; color: black">
                                <h4 class="mb-1 fs-5 fw-bold">${product.name}</h4>
                            </a>
                            <b class="fs-4 text-danger">$${product.price}</b>
                            <s class="fs-5 ps-3">${product.price + 20.00}</s>

                            <ul class="mt-0 vgth ps-0">
                                <li class="fs-8 d-none d-md-block">
                                    <i class="fa-solid fa-star text-warning"></i>
                                    <i class="fa-solid fa-star text-warning"></i>
                                    <i class="fa-solid fa-star text-warning"></i>
                                    <i class="fa-solid fa-star text-warning"></i>                                      
                                    <i class="fa-regular fa-star text-warning"></i>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>    
            </c:forEach>
        </div>
        <div class="col-md-10 text-center mx-auto">
            <a class="text-dark" href="MainController?action=Shopping_Page">View all producs <i class="fa-solid fa-arrow-right"></i></a>
        </div>
    </div>
</div>
<!--end product-->

<!--ad-->
<div class="ad-cover container-fluid pb-4 mt-4">
    <div class="container-lg">
        <div class="row">
            <div class="col-md-4">
                <img class="bg-white shadow-md p-2" src="https://s.net.vn/YiAG" alt="">
            </div>
            <div class="col-md-4">
                <img class="bg-white shadow-md p-2" src="https://s.net.vn/bPmt" alt="">
            </div>
            <div class="col-md-4">
                <img class="bg-white shadow-md p-2" src="https://s.net.vn/6LhU" alt="">
            </div>
        </div>
    </div>
</div>
<!--end-ad-->

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
