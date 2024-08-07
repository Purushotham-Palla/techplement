
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.quotes.model.Quote, com.quotes.model.Users" %>

<%
String name = (String)session.getAttribute("name");
if (name == null) {
    response.sendRedirect("login.jsp");
    return;
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home | Quote of the Day</title>
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
            border-left: 1px solid black;
			border-right: 1px solid black;
            
			border-top: 1px dotted black;
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
           	transition: background-color 0.3s, transform 0.3s;
        }
        .button:hover {
            background: #0056b3;
            transform: scale(1.05);
        }
        .logout {
            display: flex;
            justify-content: flex-end;
            margin-bottom: 20px;
        }
		select {
		    height: 40px;
		    border-radius: 8px;
		    border: 1px solid #ccc;
		    padding: 0 10px;
		    font-size: 16px;
		    color: #333;
		    background-color: #f9f9f9;
		    background-position: right 10px center;
		    background-size: 10px;
		    cursor: pointer;
		    transition: border-color 0.3s, background-color 0.3s;
		}
		
		select:focus {
		    border-color: #007bff;
		    background-color: #e9f5ff;
		    outline: none;
		}
		
		option:first-of-type {
		    color: #aaa;
		}
		
		.select-container {
		    max-width: 300px; 
		    margin: 0 auto;
		}
        
        
    </style>
</head>
<body>
    <div class="container">
    <div class="logout">
        <a href="logoutservlet" onclick="return confirm('Are you sure you want to Logout?');" class="button">Logout</a>
    </div>
        <h1>Quote of the Day</h1>
        <div class="card">
            <p class="quote-text">
                <strong>
                    <%= request.getAttribute("quote") != null ? ((Quote) request.getAttribute("quote")).getText() : "Welcome" %>
                </strong>
            </p>
            <p class="quote-author">
                - <%= request.getAttribute("quote") != null ? ((Quote) request.getAttribute("quote")).getAuthor() : "Good to see you today!" %>
            </p>
        </div>
        <div class="form-container">
            <form action="quote" method="get">
                <input type="hidden" name="action" value="random"/>
                <button class="button" type="submit">
                    <%= request.getAttribute("quote") == null ? "Show Today's Quote" : "New Quote" %>
                </button>
            </form>
        </div>
        <div class="form-container">
            <form action="quote" method="get">
			    <input type="hidden" name="action" value="search"/>
			    <select name="author" required>
			    	<option value="" disabled selected>List of authors</option>
			        <option value="Thomas Edison">Thomas Edison</option>
			        <option value="Byron Pulsifer">Byron Pulsifer</option>
			        <option value="Karen Clark">Karen Clark</option>
			        <option value="Yogi Berra">Yogi Berra</option>
			        <option value="Abraham Lincoln">Abraham Lincoln</option>
			        <option value="Johann Wolfgang von Goethe">Johann Wolfgang von Goethe</option>
			        <option value="Byron Pulsifer">Byron Pulsifer</option>
			        <option value="Lao Tzu">Lao Tzu</option>
			        <option value="Carl Sandburg">Carl Sandburg</option>
			        <option value="Aristotle">Aristotle</option>
			        <option value="Margaret Sangster">Margaret Sangster</option>
			        <option value="Buddha">Buddha</option>
			        <option value="Byron Pulsifer">Byron Pulsifer</option>
			        <option value="Iris Murdoch">Iris Murdoch</option>
			        <option value="Karen Clark">Karen Clark</option>
			        <option value="Wayne Dyer">Wayne Dyer</option>
			    </select>
			    <button class="button" type="submit">Search</button>
			</form>
            
        </div>
    </div>
</body>
</html>
