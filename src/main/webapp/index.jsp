<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Quote of the Day</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(135deg, #f6d365 0%, #fda085 100%);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .card {
            background: rgba(255, 255, 255, 0.85);
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
            text-align: center;
            width: 350px;
            backdrop-filter: blur(10px);
        }
        h1 {
            color: #333;
            margin-bottom: 20px;
            font-size: 28px;
        }
        p {
            color: #555;
            font-size: 16px;
            margin-bottom: 30px;
        }
        .buttons {
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .buttons a {
            text-decoration: none;
            color: white;
            background-color: #007BFF;
            padding: 12px 24px;
            margin: 10px 0;
            border-radius: 25px;
            width: 80%;
            text-align: center;
            font-size: 16px;
            font-weight: bold;
            transition: background-color 0.3s, transform 0.3s;
        }
        .buttons a:hover {
            background-color: #0056b3;
            transform: scale(1.05);
        }
    </style>
</head>
<body>
    <div class="card">
        <h1>Welcome to Quote of the Day</h1>
        <p>Discover inspiring quotes every day</p>
        <div class="buttons">
            <a href="login.jsp">Login</a>
            <a href="register.jsp">Register</a>
        </div>
    </div>
</body>
</html>
