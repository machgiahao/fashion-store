<%-- 
    Document   : shopping
    Created on : Jun 14, 2024, 8:26:33 AM
    Author     : LENOVO
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="sample.shopping.Products"%>
<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
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

            .page-active {
                background-color: #489bdb !important;
                color: white !important;
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
                    <li class="nav-item"><a href="MainController?action=Shopping_Page" class="nav-link text-ligh btn-bg-active">Products</a></li>
                    <li class="nav-item"><a href="#" class="nav-link text-light">Services</a></li>
                    <li class="nav-item"><a href="#" class="nav-link text-light">FAQs</a></li>
                    <li class="nav-item"><a href="#" class="nav-link text-light">About</a></li>
                </ul>
            </header>
        </div>
    </div>
</header>

<form action="MainController" method="POST" class="mt-3">
    <div class="container">
        <div class="row">
            <!-- sidebar -->
            <div class="col-lg-3">
                <!-- Toggle button -->
                <button
                    class="btn btn-outline-secondary mb-3 w-100 d-lg-none"
                    type="button"
                    data-mdb-toggle="collapse"
                    data-mdb-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent"
                    aria-expanded="false"
                    aria-label="Toggle navigation"
                    >
                    <span>Show filter</span>
                </button>
                <!-- Collapsible wrapper -->
                <div class="collapse card d-lg-block mb-5" id="navbarSupportedContent">
                    <div class="accordion" id="accordionPanelsStayOpenExample">
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="headingOne">
                                <button
                                    class="accordion-button text-light bg-header"
                                    type="button"
                                    data-mdb-toggle="collapse"
                                    data-mdb-target="#panelsStayOpen-collapseOne"
                                    aria-expanded="true"
                                    aria-controls="panelsStayOpen-collapseOne"
                                    >
                                    Related items
                                </button>
                            </h2>
                            <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne">
                                <div class="accordion-body">
                                    <ul class="list-unstyled">
                                        <li><a href="#" class="text-dark">Men's clothing </a></li>
                                        <li><a href="#" class="text-dark">Women's clothing </a></li>
                                        <li><a href="#" class="text-dark">Shoes </a></li>
                                        <li><a href="#" class="text-dark">Accessories </a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="headingTwo">
                                <button
                                    class="accordion-button text-light bg-header"
                                    type="button"
                                    data-mdb-toggle="collapse"
                                    data-mdb-target="#panelsStayOpen-collapseTwo"
                                    aria-expanded="true"
                                    aria-controls="panelsStayOpen-collapseTwo"                                   
                                    >
                                    Brands
                                </button>
                            </h2>
                            <div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse show" aria-labelledby="headingTwo">
                                <div class="accordion-body">
                                    <div>
                                        <!-- Checked checkbox -->
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked1" />
                                            <label class="form-check-label" for="flexCheckChecked1">Gucci</label>
                                            <span class="badge badge-secondary float-end">120</span>
                                        </div>
                                        <!-- Checked checkbox -->
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked2" />
                                            <label class="form-check-label" for="flexCheckChecked2">Louis Vuitton</label>
                                            <span class="badge badge-secondary float-end">15</span>
                                        </div>
                                        <!-- Checked checkbox -->
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked3" />
                                            <label class="form-check-label" for="flexCheckChecked3">Hermès</label>
                                            <span class="badge badge-secondary float-end">35</span>
                                        </div>
                                        <!-- Checked checkbox -->
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked4" />
                                            <label class="form-check-label" for="flexCheckChecked4">Chanel</label>
                                            <span class="badge badge-secondary float-end">89</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="headingThree">
                                <button
                                    class="accordion-button text-light bg-header"
                                    type="button"
                                    data-mdb-toggle="collapse"
                                    data-mdb-target="#panelsStayOpen-collapseThree"
                                    aria-expanded="false"
                                    aria-controls="panelsStayOpen-collapseThree"
                                    >
                                    Price
                                </button>
                            </h2>
                            <div id="panelsStayOpen-collapseThree" class="accordion-collapse collapse show" aria-labelledby="headingThree">
                                <div class="accordion-body">
                                    <div class="range">
                                        <input type="range" class="form-range" id="customRange1" />
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-6">
                                            <p class="mb-0">
                                                Min
                                            </p>
                                            <div class="form-outline">
                                                <input type="number" id="typeNumber" class="form-control" />
                                                <label class="form-label" for="typeNumber">$0</label>
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <p class="mb-0">
                                                Max
                                            </p>
                                            <div class="form-outline">
                                                <input type="number" id="typeNumber" class="form-control" />
                                                <label class="form-label" for="typeNumber">$1,0000</label>
                                            </div>
                                        </div>
                                    </div>
                                    <button type="button" class="btn btn-white w-100 border border-secondary">apply</button>
                                </div>
                            </div>
                        </div>
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="headingThree">
                                <button
                                    class="accordion-button text-light bg-header"
                                    type="button"
                                    data-mdb-toggle="collapse"
                                    data-mdb-target="#panelsStayOpen-collapseFour"
                                    aria-expanded="false"
                                    aria-controls="panelsStayOpen-collapseFour"
                                    >
                                    Size
                                </button>
                            </h2>
                            <div id="panelsStayOpen-collapseFour" class="accordion-collapse collapse show" aria-labelledby="headingThree">
                                <div class="accordion-body">
                                    <input type="checkbox" class="btn-check border justify-content-center" id="btn-check1" checked autocomplete="off" />
                                    <label class="btn btn-white mb-1 px-1" style="width: 60px;" for="btn-check1">XS</label>
                                    <input type="checkbox" class="btn-check border justify-content-center" id="btn-check2" checked autocomplete="off" />
                                    <label class="btn btn-white mb-1 px-1" style="width: 60px;" for="btn-check2">SM</label>
                                    <input type="checkbox" class="btn-check border justify-content-center" id="btn-check3" checked autocomplete="off" />
                                    <label class="btn btn-white mb-1 px-1" style="width: 60px;" for="btn-check3">LG</label>
                                    <input type="checkbox" class="btn-check border justify-content-center" id="btn-check4" checked autocomplete="off" />
                                    <label class="btn btn-white mb-1 px-1" style="width: 60px;" for="btn-check4">XXL</label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- sidebar -->

            <!--content-->
            <div class="col-lg-9">
                <header class="d-sm-flex align-items-center border-bottom mb-4 pb-3">
                    <strong class="d-block py-2">Products </strong>
                    <div class="ms-auto">
                        <select class="form-select d-inline-block w-auto border pt-1">
                            <option value="0">Best match</option>
                            <option value="1">Recommended</option>
                            <option value="2">High rated</option>
                            <option value="3">Randomly</option>
                        </select>
                        <div class="btn-group shadow-0 border">
                            <a href="#" class="btn btn-light" title="List view">
                                <i class="fa fa-bars fa-lg"></i>
                            </a>
                            <a href="#" class="btn btn-light active" title="Grid view">
                                <i class="fa fa-th fa-lg"></i>
                            </a>
                        </div>
                    </div>
                </header>
                <div class="row m-0">
                    <c:if test="${requestScope.LIST_BY_PAGE != null}">
                        <c:if test="${not empty requestScope.LIST_BY_PAGE}">
                            <c:forEach var="product" varStatus="counter" items="${requestScope.LIST_BY_PAGE}">
                                <div class="col-lg-3 col-md-4 mb-4">
                                    <div class="bg-white p-2 shadow-md">
                                        <div class="text-center">
                                            <input type="hidden" name="productID" value="${product.productID}">
                                            <a href="MainController?action=viewDetail&productID=${product.productID}">
                                                <img src="${product.img}" alt="" width="170" height="180">
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
                                            <div class="row pt-2">
                                                <div class="col">
                                                    <a href="MainController?action=viewDetail&productID=${product.productID}">
                                                        <p class="btn mb-2 fw-bold w-200 btn-danger">View Detail</p>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:if>
                    </c:if> 
                </div>
                <!--end list product-->
                <hr>
                <!-- Pagination -->
                <c:set var="page" value="${requestScope.PAGE}"/>
                <nav aria-label="Page navigation example" class="d-flex justify-content-center mt-3">
                    <ul class="pagination">
                        <li class="page-item disabled">
                            <a class="page-link" href="#" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                        <c:forEach begin="${1}" end="${requestScope.NUMBER_PAGE}" var="i">
                            <li class="page-item"><a class="page-link ${i==page?"page-active":""}" href="MainController?action=Shopping_Page&page=${i}">${i}</a></li>
                            </c:forEach>
                        <li class="page-item">
                            <a class="page-link" href="#" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </ul>
                </nav>
                <!-- Pagination -->
            </div>
        </div>
    </div>
</form>

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
