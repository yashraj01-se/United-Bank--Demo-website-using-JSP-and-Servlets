<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - United Bank</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: whitesmoke;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: flex-start;  /* Changed to start so it doesn't take the whole screen height */
            min-height: 100vh;  /* Ensures the body takes at least the full viewport height */
        }

       /* Navbar */
        .navbar {
            background-color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 1em 2em;
            
            top: 0;
            left: 0;
            width: 100%;
            z-index: 10; /* Ensure navbar stays on top */
        }

        .navbar .logo {
            margin-left: 50px;
            font-size: 1.5em;
            font-weight: bold;
            color: black;
        }

        .navbar a {
            color: black;
            text-decoration: none;
            padding: 0.5em 1em;
            transition: background-color 0.3s ease;
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


        .login-container {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
            padding: 2.5em;
            width: 90%;
            max-width: 450px;
            text-align: center;
            margin-top: 40px;  /* Adjusted to avoid overlap with navbar */
            margin-bottom: 20px;
            border: 1px solid black;
            background-color: #f9f9f9;
        }

        .login-container h2 {
            margin-bottom: 1.5em;
            font-size: 1.8em;
            color: #333;
        }

        .login-container input {
            width: 100%;
            padding: 0.5em;
            margin-bottom: 1em;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .login-container button {
            width: 70%;
            padding: 0.5em;
            background-color: rgb(43, 46, 46);
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-top: 10px;
        }

        .login-container button:hover {
            background-color: black;
        }

        .login-container a {
            color: black;
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

    <div class="login-container">
        <h2>Login</h2>

        <!-- Display error message if exists -->
        <% if (request.getParameter("error") != null && request.getParameter("error").equals("invalid_credentials")) { %>
            <div class="error-message">
                Invalid Username or Password.
            </div>
        <% } else if (request.getParameter("error") != null && request.getParameter("error").equals("error")) { %>
            <div class="error-message">
                Error in Password reset.
            </div>
        <%   } else if(request.getParameter("error")!=null && request.getParameter("error").equals("login")) { %>
        <div class="error-message">
                First login in your Account.
            </div>
        <% } else if(request.getParameter("error")!=null && request.getParameter("error").equals("loginn")) { %>
        <div class="error-message">
                First login in your Account.
            </div>
        
        <% } %>
        
      

        <!-- Display success message if exists -->
        <% if (request.getParameter("success") != null && request.getParameter("success").equals("logged_in")) { %>
            <div class="success-message">
                Successfully logged into the Account.<br>
                <a href="home page.jsp" class="ref">Home Page</a>
            </div>
        <% } else if (request.getParameter("success") != null && request.getParameter("success").equals("updated_password")) { %>
            <div class="success-message">
                Successfully updated your Password.
            </div>
        <% } %>

        <!-- Login Form -->
        <form action="login" method="POST">
            <input type="text" name="username" placeholder="Username" required>
            <input type="password" name="password" placeholder="Password" required>
            <button type="submit">Login</button>
        </form>
        <p><a href="Forget_password.jsp">Forgot Password?</a></p>
        <p><a href="account.jsp">Create an Account</a></p>
    </div>

    

</body>
</html> 