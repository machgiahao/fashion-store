<%-- 
    Document   : viewDetail
    Created on : Jul 6, 2024, 3:38:52 PM
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

            .icon-hover:hover {
                border-color: #3b71ca !important;
                background-color: white !important;
                color: #3b71ca !important;
            }

            .icon-hover:hover i {
                color: #3b71ca !important;
            }
        </style>
    </head>
    <body>
        <c:if test="${sessionScope.LOGIN_USER == null}">
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
                                    <li class="p-2 d-none d-md-block"><a href="login.html"><button class="btn px-4 btn-outline-success">Login</button></a></li>
                                    <li class="p-2 d-none d-md-block"><a href="create.html"><button class="btn px-4 btn-success">Sign Up</button></a></li>
                                </ul>
                            </c:if>
                            <c:if test="${sessionScope.LOGIN_USER != null}" >
                                <ul class="ms-auto d-inline-flex">
                                    <div class="flex-shrink-0 dropdown">
                                        <a href="#" class="d-block link-body-emphasis text-decoration-none dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                                            <img src="https://s.net.vn/m4lC" alt="mdo" width="32" height="32" class="rounded-circle">
                                        </a>
                                        <ul class="dropdown-menu text-small shadow">
                                            <li><a class="dropdown-item" href="user.jsp">Profile</a></li>
                                            <li><a class="dropdown-item" href="#">My order</a></li>
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
                    <a href="index.html">
                        <img class="logo" src="./img/logo1.png" alt="">
                    </a> 
                </div>
                <div class="col-md-6 d-none d-md-block pt-1 pb-2">
                    <div class="input-group pt-1 mb-0">
                        <input type="text" class="form-control border-end-0 mb-0" placeholder="Search Apps" aria-label="Recipient's username" aria-describedby="basic-addon2">
                        <span class="input-group-text sit border-start-0" id="basic-addon2"><i class="fa-solid fa-magnifying-glass"></i></i></span>
                    </div>
                </div>
                <div class="col-md-3 col-3 pt-1 text-end">
                    <button type="button" class="btn btn-light shadow-md border position-relative">
                        <a href="MainController?action=VIEW" class="text-dark"><i class="fa-solid fa-bag-shopping"></i></a>
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
                    <li class="nav-item"><a href="MainController?action=Shopping_Page" class="nav-link text-light btn-bg-active">Products</a></li>
                    <li class="nav-item"><a href="#" class="nav-link text-light">Services</a></li>
                    <li class="nav-item"><a href="#" class="nav-link text-light">FAQs</a></li>
                    <li class="nav-item"><a href="#" class="nav-link text-light">About</a></li>
                </ul>
            </header>
        </div>
    </div>
</header>

<!--view detail -->
<c:set var="product" value="${requestScope.PRODUCT_DETAIL}"></c:set>
    <form class="py-5">
        <div class="container">
            <div class="row gx-5">
                <aside class="col-lg-6 pt-5">
                    <div class="border rounded-4 mb-3 d-flex justify-content-center">
                        <a data-fslightbox="mygalley" class="rounded-4" target="_blank" data-type="image" href="${product.img}">
                        <img style="max-width: 100%; max-height: 100vh; margin: auto;" class="rounded-4 fit" src="${product.img}" />
                    </a>
                </div>
            </aside>
            <main class="col-lg-6">
                <div class="ps-lg-3">
                    <label style="color: red">${requestScope.MESSAGE}</label>
                    <h4 class="title text-dark">
                        ${product.name}
                    </h4>
                    <div class="d-flex flex-row my-3">
                        <div class="text-warning mb-1 me-2">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fas fa-star-half-alt"></i>
                            <span class="ms-1">
                                4.5
                            </span>
                        </div>
                        <span class="text-muted"><i class="fas fa-shopping-basket fa-sm mx-1"></i>154 orders</span>
                        <span class="text-success ms-2">In stock</span>
                    </div>

                    <div class="mb-3">
                        <span class="h5">$${product.price}</span>
                    </div>

                    <div class="row">
                        <dt class="col-3">ProductID: </dt>
                        <dd class="col-9">${product.productID}</dd>

                        <dt class="col-3">Quantity</dt>
                        <dd class="col-9">${product.quantity}</dd>
                    </div>

                    <hr />

                    <div class="row mb-4">
                        <div class="col-md-4 col-6">
                            <label class="mb-2">Size</label>
                            <select class="form-select border border-secondary" style="height: 35px;">
                                <option>Small</option>
                                <option>Medium</option>
                                <option>Large</option>
                            </select>
                        </div>
                        <!-- col.// -->
                        <div class="col-md-4 col-6 mb-3">
                            <label class="mb-2 d-block">Quantity</label>
                            <div class="input-group mb-3" style="width: 170px;">
                                <button class="btn btn-white border border-secondary px-3" type="button" id="button-addon1" data-mdb-ripple-color="dark" onclick="decrement()">
                                    <i class="fas fa-minus"></i>
                                </button>
                                <input type="text" id="quantity" class="form-control text-center border border-secondary" value="1" name="quantityBuy" aria-label="Example text with button addon" aria-describedby="button-addon1" />
                                <button class="btn btn-white border border-secondary px-3" type="button" id="button-addon2" data-mdb-ripple-color="dark" onclick="increment()">
                                    <i class="fas fa-plus"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                    <input type="hidden" name="productID" value="${product.productID}"/>
                    <input type="hidden" name="nameProduct" value="${product.name}"/>
                    <input type="hidden" name="priceProduct" value="${product.price}"/>
                    <input type="hidden" name="img" value="${product.img}"/>
                    <button class="btn btn-warning shadow-0" type="submit" name="action" value="Buy"> Buy now </button>
                    <button class="btn btn-primary shadow-0" type="submit" name="action" value="Add"> <i class="me-1 fa fa-shopping-basket"></i> Add to cart </button>
                    <a href="#" class="btn btn-light border border-secondary py-2 icon-hover px-3"> <i class="me-1 fa fa-heart fa-lg"></i> Save </a>
                </div>
            </main>
        </div>
    </div>
    <div class="latest-products pt-5 pb-0">
        <div class="container-xl">
            <div class="section-tile row">
                <div class="col-md-10 text-center mx-auto">
                    <h2 id="products">Another Items</h2>
                </div>
            </div>
            <div class="row mt-5">
                <c:forEach var="product" varStatus="counter" items="${requestScope.LIST_ANOTHER_PRODUCT}">
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
                                <s class="fs-5 ps-3">20.00</s>

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
</form>
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
<script>
    function increment() {
        var quantity = document.getElementById('quantity');
        var currentValue = parseInt(quantity.value);
        quantity.value = currentValue + 1;
    }

    function decrement() {
        var quantity = document.getElementById('quantity');
        var currentValue = parseInt(quantity.value);
        if (currentValue > 0) {
            quantity.value = currentValue - 1;
        }
    }
</script>
</body>
</html>
