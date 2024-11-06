<%-- 
    Document   : forgot.jsp
    Created on : Jul 9, 2024, 10:04:49 PM
    Author     : LENOVO
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
                integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"
                integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy"
        crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/2b9cdc1c9a.js" crossorigin="anonymous"></script>
        <link href="./css/login.css" rel="stylesheet">
        <style>
            .error {
                color: red;
                font-weight: bold;
            }
        </style>
    </head>
    <body>
    <body>
        <div class="bg-img">
            <div class="content mt-5 pt-4">
                <h3 class="text-center text-light">Password Reset</h3>
                <c:if test="${requestScope.SUCCESS != null}">
                    <div class="text-success fw-bold">${requestScope.SUCCESS}</div>
                </c:if>
                <c:if test="${requestScope.SUCCESS == null}">
                    <form action="MainController" method="POST">
                        <div id="error" class="text-danger fw-bold">${requestScope.ERROR}</div>
                        <div class="row space">
                            <div data-mdb-input-init class="form-outline">
                                <input type="text" placeholder="Email" id="" class="form-control form-control-lg" name="email" value="${param.email}" required/>
                            </div>
                        </div>
                        <div class="row space">
                            <div data-mdb-input-init class="form-outline">
                                <input type="password" placeholder="Password" id="" class="form-control form-control-lg" name="password" required/>
                            </div>
                        </div>

                        <div class="row">
                            <div data-mdb-input-init class="form-outline">
                                <label class="form-label error" for="firstName">${requestScope.USER_ERROR.confirmError}</label>
                                <input type="password" placeholder="Confirm password" id="" class="form-control form-control-lg" name="confirm" required/>
                            </div>
                        </div>
                        <div class="field space">
                            <input type="submit" name="action" value="Reset">
                        </div>
                    </form>
                </c:if>
                <div class="space">
                    <a href="MainController?action=Login_Page"><i class="fa-solid fa-arrow-left"></i> Login</a>
                </div>
            </div>
        </div>
    </body>
</body>
</html>
