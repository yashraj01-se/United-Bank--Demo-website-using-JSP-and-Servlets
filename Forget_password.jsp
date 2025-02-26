<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot Password - United Bank</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: whitesmoke;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center; /* Center the content vertically */
            min-height: 100vh;  /* Ensure the body takes at least full height of the viewport */
            padding-top: 60px; /* Prevent overlap with the fixed navbar */
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


        .forgot-password-container {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
            padding: 2.5em;
            width: 90%;
            max-width: 450px;
            text-align: center;
            margin-top: 10px; 
            margin-bottom: 20px;
            border: 1px solid black;
            background-color: #f9f9f9;
        }

        .forgot-password-container h2 {
            margin-bottom: 1.5em;
            font-size: 1.8em;
            color: #333;
        }

        .forgot-password-container input {
            width: 100%;
            padding: 0.5em;
            margin-bottom: 1em;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .forgot-password-container button {
            width: 70%;
            padding: 0.5em;
            background-color: rgb(43, 46, 46);
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-top: 10px;
        }

        .forgot-password-container button:hover {
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

    <div class="forgot-password-container">
        <h2>Forgot Password</h2>

        <!-- Conditionally show error message if error parameter exists -->
        <% 
        String error = request.getParameter("error");
        if (error != null && error.equals("error")) {
        %>
            <div class="error-message">
                Invalid Email. Please try again.
            </div>
        <% 
        }
        %>

        <form action="Forget_password" method="POST">
            <input type="email" name="email" placeholder="Enter your email" required>
            <button type="submit" class="button">Reset Password</button>
        </form>
    </div>

</body>
</html>
