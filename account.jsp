<%@ page import="java.util.Random" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Bank Account - United Bank</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: whitesmoke;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center; /* Centers the content vertically */
            min-height: 100vh;
            margin: 0;
            padding: 0;
        }

        .navbar {
            display: flex;
            justify-content: space-between; /* Space between logo and home link */
            align-items: center;
            background-color: white;
            padding: 0.5em 2em;
            width: 100%;
            position: absolute;
            top: 0;
            height: 60px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .navbar .logo-container {
            display: flex;
            align-items: center;
            margin-left: 20px; /* Shift logo and "United Bank" to the right */
        }

        .navbar .logo {
            font-size: 1.5em;
            font-weight: bold;
            margin-left: 10px;
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

        /* Ensure the "Home" link is pushed to the left */
        .navbar .home-link {
            margin-left: 10px;
        }

      .account-container {
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

.account-container h1 {
    margin-bottom: 1.5em;  /* Increased space for better separation */
    font-size: 1.8em;  /* Slightly larger heading */
    color: #333;  /* Darker text for visibility */
}

.account-container input, .account-container select {
    width: 100%;
    padding: 0.75em;  /* Increased padding for better readability */
    margin-bottom: 1.5em; /* Larger space between form fields */
    border: 1px solid #ccc;
    border-radius: 4px;
    font-size: 1em;  /* Larger font size for easier reading */
}

.account-container button {
    width: 75%;
    padding: 0.75em;
    background-color: black;  /* Stronger, more visible button color */
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 1.2em;  /* Larger font for the button */
}

.account-container button:hover {
    background-color: gray;  /* Darker button color on hover */
}


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

        .error-message {
            background-color: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }

        .success-message {
            background-color: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }

        .error-message:hover, .success-message:hover {
            opacity: 1;
            transform: translateY(-5px);
        }

        .log_in{
            color: green;
        }

        /* Responsive styling */
        @media (max-width: 480px) {
            .navbar {
                flex-direction: column;
                justify-content: flex-start;
                padding: 1em;
            }

            .account-container {
                margin-top: 20px;  /* Reduced for smaller screens */
                width: 90%;
            }
        }
         
    </style>
</head>
<body>
    <div class="navbar">
        <div class="logo-container">
            <img src="photos/logo.jpg" style="height: 40px;" alt="Logo">
            <div class="logo">United Bank</div>
        </div>

        <!-- Home hyperlink aligned to the left -->
        <a href="home_page.jsp" class="home-link">Home</a>
    </div>

    <div class="account-container">
        <h1>Create Login Account</h1>
        
        <% 
        String error = request.getParameter("error");
        if (error != null && error.equals("account_exists")) {
        %>
            <div class="error-message">
                Account with the same username and password already exists. Please try again.
            </div>
        <% 
        }
        %>

        <% 
        String success = request.getParameter("success");
        if (success != null && success.equals("account_created")) {
        %>
            <div class="success-message">
                Account created successfully!
            </div>
        <% 
        }
        %>

       

        <form action="registration" method="POST">
            <input type="text" name="id" placeholder="ID (alphabets only)" required>
            <input type="text" name="username" placeholder="Username" required>
            <input type="password" name="password" placeholder="Password (alphabets only)" required>
            
            <input type="text" name="email" placeholder="Email" required>
            <input type="text" name="phone" placeholder="Phone Number" required>
            <input type="text" name="address" placeholder="Address" required>
            <input type="text" name="city" placeholder="City" required>
            <input type="text" name="state" placeholder="State" required>
            <input type="text" name="zipCode" placeholder="Zip Code" required>
            <button type="submit">Create Account</button>
        </form>
   
</body>
</html>
