<!-- resetPassword.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reset Password - United Bank</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: whitesmoke;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }
        /* Navbar */
        .navbar {
            background-color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 1em 2em;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            z-index: 10; /* Ensure navbar stays on top */
        }

        .navbar .logo {
            font-size: 1.5em;
            font-weight: bold;
            color: black;
        }

        .navbar a {
            color: black;
            text-decoration: none;
            padding: 0.5em 1em;
            transition: background-color 0.3s ease;
            margin-right: 60px;
        }

        .navbar a:hover {
            background-color: gainsboro;
            border-radius: 5px;
        }

        .navbar .logo-container {
            display: flex; 
            align-items: center;
        }

        .navbar .logo {
            font-size: 1.5em;
            font-weight: bold;
            margin-left: 10px; 
        }

           .reset-password-container {
    background-color: white;  /* Ensure a white background */
    border-radius: 8px;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2); /* Stronger shadow for more emphasis */
    padding: 2.5em;  /* Increased padding for better spacing */
    width: 90%;
    max-width: 450px; /* Slightly wider form for better visibility */
    text-align: center;
    margin-top: 80px; /* Slightly adjusted to avoid overlap with navbar */
    margin-bottom: 20px;
    border: 1px solid black; /* Blue border to make the container stand out */
    background-color: #f9f9f9; /* Light gray background to contrast with the page */
}

.reset-password-container h1 {
    margin-bottom: 1.5em;  /* Increased space for better separation */
    font-size: 1.8em;  /* Slightly larger heading */
    color: #333;  /* Darker text for visibility */
}

        .reset-password-container input {
            width: 100%;
            padding: 0.5em;
            margin-bottom: 1em;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .reset-password-container button {
            width: 70%;
            padding: 0.5em;
            background-color: rgb(43, 46, 46);
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .reset-password-container button:hover {
            background-color: black;
        }

        /* Message Styles */
        .error-message, .success-message {
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 1em;
            margin-bottom: 1.5em;
            border-radius: 5px;
            font-weight: bold;
            text-align: center;
            transition: opacity 0.5s ease, transform 0.3s ease;
            opacity: 1;
            transform: translateY(0);
        }

        /* Error Message */
        .error-message {
            background-color: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }

        /* Success Message */
        .success-message {
            background-color: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }

        /* Hover/Focus Effects for Error/Success Messages */
        .error-message:hover, .success-message:hover {
            opacity: 1;
            transform: translateY(-5px);
        }
         /* Footer */
        

        
    </style>
      
</head>
<body>
    <div class="navbar">
    <div class="logo-container">
        <img src="photos/logo.jpg" style="height: 40px;" alt="Logo">
        <div class="logo">United Bank</div>
    </div>
    <div>
        <a href="home_page.jsp">Home</a>
    </div>
</div>

    <div class="reset-password-container">
        <h2>Reset Password</h2>
        <form action="resetPassword" method="POST">
            <input type="hidden" name="email" value="<%= request.getParameter("email") %>">
            <input type="password" name="newPassword" placeholder="New Password" required>
            <button type="submit">Update Password</button>
        </form>
       
    </div>
            
 


</body>
</html>
