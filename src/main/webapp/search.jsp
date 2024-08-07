<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.quotes.model.Quote,java.util.*" %>
<%
String name = (String)session.getAttribute("name");
if (name == null) {
    response.sendRedirect("login.jsp");
    return;
}
%>

<!DOCTYPE html>

<html>
<head>
    <title>Search Results</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #E9F5FF;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 800px;
            margin: 50px auto;
            background: white;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        h1 {
            text-align: center;
            color: #333;
        }
        .card {
            background: #fafafa;
            padding: 20px;
            margin: 20px 0;
            border-radius: 8px;
            border:1px solid black;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
        }
	    .quote-text {
		    font-size: 1.5em;
		    color: #555;
		    margin: 0;
		    text-align: center;
		    transition: background 0.3s, transform 0.3s;
		}
	
		.quote-text:hover {
		    transform: scale(1.05);
		}

        .quote-author {
            font-size: 1.2em;
            color: #888;
            margin-top: 10px;
            text-align: right;
        }
        .form-container {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }
        .form-container form {
            margin: 0 10px;
        }
        .button {
            display: inline-block;
            padding: 10px 20px;
            font-size: 1em;
            color: white;
            background: #007BFF;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            cursor: pointer;
            transition: background 0.3s,transform 0.3s;
        }
        .button:hover {
            background: #0056b3;
            transform: scale(1.05);
        }
        .nav {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }
    </style>
    
</head>
<body>
    <div class="container">
    
    <div class="nav">
	    <div class="back">
	        <a href="quote?action=random" class="button">Back to Home</a>
	    </div>
	    <div class="logout">
        <a href="logoutservlet" onclick="return confirm('Are you sure you want to Logout?');" class="button">Logout</a>
	    </div>
    </div>
        <h1>Search Results</h1>
        <div class="card-container">
            <% 
            List<Quote> quotes = (List<Quote>) request.getAttribute("quotes");
            if (quotes != null && !quotes.isEmpty()) {
                for (Quote quote : quotes) {
                	%>
                	<div class="card">
                        <p class="quote-text"><strong><%= quote.getText()%></strong></p><br>
                        <p class="quote-author">- <%=quote.getAuthor() %></p>
                    </div>
                   <%out.println();
                }
            } else {
            	%>
            	<p>No quotes found.</p>
            	<%
            }
            %>
        </div>
    </div>
</body>
</html>
