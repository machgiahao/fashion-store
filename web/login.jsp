<%-- 
    Document   : login
    Created on : May 28, 2024, 8:57:24 AM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login Page</title>
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
        <link href="./css/login.css" rel="stylesheet">
        <style>
        </style>
    </head>
    <body>
        <div class="bg-img">
            <div class="content">
                <header>Login</header>
                <form id="form" action="MainController" method="POST">
                    <div id="error" class="text-danger fw-bold">${requestScope.ERROR}</div>
                    <div class="field space">
                        <span class="fa fa-user"></span>
                        <input type="text" required placeholder="UserID" name="userID">
                    </div>
                    <div class="field space">
                        <span class="fa fa-lock"></span>
                        <input type="password" class="password" required placeholder="Password" name="password">
                    </div>
                    <div class="pass">
                        <a href="MainController?action=Forgot">Forgot Password?</a>
                    </div>
                    <div class="field">
                        <input type="submit" name="action" value="Login">
                    </div>
                    <div class="space">
                        <div id="error" class="text-danger fw-bold"></div>
                        <div class="g-recaptcha" data-sitekey="6LeRnQUqAAAAANQN65u5Od1TOP4Hn70Oo5zhwODo"></div>
                    </div>
                    <div class="text-center">
                        <p class="text-light">Not a member? <a href="MainController?action=Create_Page">Register</a></p>
                        <p class="text-light">or sign up with:</p>
                        <button  type="button" data-mdb-button-init data-mdb-ripple-init class="btn btn-link btn-floating mx-1 border border-danger btn btn-outline-danger">
                            <a href="https://accounts.google.com/o/oauth2/auth?scope=profile email&redirect_uri=http://localhost:8080/UserManagement/LoginGoogleController&response_type=code&client_id=1058278488057-7okevd71v31cihcslbi8n38rbggnm196.apps.googleusercontent.com&approval_prompt=force">
                                <i class="fab fa-google text-danger"></i>
                            </a>
                        </button>

                        <button  type="button" data-mdb-button-init data-mdb-ripple-init class="btn btn-link btn-floating mx-1 border border-primary btn btn-outline-primary">
                            <i class="fab fa-facebook-f"></i>
                        </button>

                        <button  type="button" data-mdb-button-init data-mdb-ripple-init class="btn btn-link btn-floating mx-1 border border-black btn btn-outline-dark">
                            <i class="fab fa-github text-light"></i>
                        </button>
                    </div>
                </form>
            </div>
        </div>
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>
        <script>
            window.onload = function () {
                const form = document.getElementById("form");
                const error = document.getElementById("error");

                form.addEventListener("submit", function (event) {
                    const recaptchaResponse = grecaptcha.getResponse();
                    if (recaptchaResponse) {
                        form.submit();
                    } else {
                        event.preventDefault();
                        error.textContent = "Please complete the reCAPTCHA.";
                    }
                });
            };
        </script>
    </body>
</html>