<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <title>Register | Quote App</title>
        <link rel="stylesheet" href="login.css">
    </head>
    <body>
        <div class="background">
            <div class="login-container">

                <div class="login-form">
                    <h2 class="form-title">Register</h2>
                    <form action="registerUser" method="post">
                        <div class="form-group">
                            <label for="name">User Name </label>
                            <input type="text" name="name" id="name" required placeholder="Enter your Name">
                        </div>
                        <div class="form-group">
                            <label for="password">Password</label>
                            <input type="password" name="password" id="password" required placeholder="Enter your password">
                        </div>
                        <button type="submit" class="submit-button">Register</button>
                    </form>
                    
                    <!-- Login Link -->
                    <div class="login-link">
                        <a href="login.jsp">Already have an account? Login here</a>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
