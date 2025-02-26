<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Contact Us - United Bank</title>
        <style>
            /* General Reset */
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            body {
                font-family: Arial, sans-serif;
                background-color: whitesmoke;
                color: #000;
                line-height: 1.6;
                display: flex; /* Flexbox for centering */
                flex-direction: column; /* Stack elements vertically */
                justify-content: flex-start; /* Align content at the top */
                min-height: 100vh; /* Ensure full height of the viewport */
                margin: 0; /* Remove default margin */
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

            /* Contact Section */
            .contact-container {
                background-color: white;
                border-radius: 8px;
                box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
                padding: 3em;
                width: 80%;
                max-width: 600px;  /* Increased max-width */
                text-align: center;
                margin-top: 120px; /* Added space to avoid navbar overlap */
                margin-bottom: 20px;
                border: 1px solid black;
                background-color: #f9f9f9;
                align-self: center;
            }

            .contact-container h1 {
                margin-bottom: 2em; /* Increased space */
                font-size: 2em;  /* Larger heading */
                color: #333;
            }

            .contact-container p {
                text-align: center;
                margin-bottom: 1.5em;
                font-size: 1.2em;  /* Larger text for better readability */
                color: #555;
            }

            .form-group {
                margin-bottom: 2em; /* Increased space between sections */
            }

            .form-group label {
                display: block;
                margin-bottom: 0.75em; /* More space between label and input */
                font-size: 1.2em;  /* Larger font size */
                font-weight: bold;
            }

            .form-group input,
            .form-group textarea {
                width: 100%;
                padding: 1em;
                border: 1px solid #ccc;
                border-radius: 5px;
                font-size: 1.2em; /* Larger text for input fields */
            }

            .form-group textarea {
                height: 180px; /* Increased height */
                resize: none;
            }

            button {
                background-color: #000;
                color: #fff;
                border: none;
                padding: 1em 3em; /* Larger padding for button */
                font-size: 1.2em; /* Larger font size */
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            button:hover {
                background-color: #444;
            }

            /* Message Styles */
            .error-message, .success-message {
                display: flex;
                align-items: center;
                justify-content: center;
                padding: 1em;
                margin-bottom: 2em; /* More space between message and form */
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

            .footer {
                background-color: #2c2c2c; /* Dark background color */
                color: white; /* Text color */
                padding: 40px 20px; /* Padding top and bottom */
                position: relative; /* Positioning for potential overlapping elements */
                width: 100%; /* Full width */
                bottom: 0; /* Stick to the bottom */
                left: 0; /* Align to the left */
                z-index: 1000; /* Ensure it stays above other elements */
                margin-top: 20px; /* Space above footer */
                display: flex; /* Use flexbox for layout */
                flex-direction: column; /* Stack items vertically */
            }

            .footer-container {
                display: flex;
                justify-content: space-around; /* Space between sections */
                align-items: flex-start; /* Align items at the start */
                flex-wrap: wrap; /* Allow wrapping of sections */
                max-width: 1200px; /* Max width of the container */
                margin: 0 auto; /* Center the container */
                padding: 20px; /* Padding inside the container */
                width: 100%; /* Ensure the container takes full width */
            }

            .footer-section {
                flex: 1; /* Take equal space */
                min-width: 200px; /* Minimum width for each section */
                margin: 10px; /* Margin around each section */
                text-align: center; /* Center text in all sections */
            }

            .footer-section h3 {
                margin-bottom: 15px; /* Space below heading */
                font-size: 1.5em; /* Heading font size */
                border-bottom: 2px solid #f0ad4e; /* Underline for headings */
                padding-bottom: 5px; /* Padding below heading */
                color: white;
            }

            .footer-section p {
                font-size: 0.9em; /* Font size for paragraph */
                line-height: 1.5; /* Line height for readability */
            }

            .footer-section.links ul {
                list-style-type: none; /* Remove bullet points */
                padding: 0; /* Remove padding */
            }

            .footer-section.links ul li {
                margin: 8px 0; /* Margin for each list item */
            }

            .footer-section.links a,
            .footer-section.contact a {
                color: #f0ad4e; /* Link color */
                text-decoration: none; /* Remove underline */
                transition: color 0.3s ease; /* Smooth transition for hover effect */
            }

            .footer-section.links a:hover,
            .footer-section.contact a:hover {
                text-decoration: underline; /* Underline on hover */
            }

            .social-icons {
                display: flex; /* Flex container for social icons */
                gap: 15px; /* Space between icons */
                justify-content: center; /* Center icons */
                flex-wrap: wrap; /* Allow wrapping on smaller screens */
            }

            .social-icons img {
                width: 40px; /* Set icon size */
                height: auto; /* Maintain aspect ratio */
                transition: transform 0.3s ease; /* Smooth transition for hover effect */
            }

            .social-icons img:hover {
                transform: scale(1.1); /* Slightly enlarge on hover */
            }

            .footer-bottom {
                text-align: center; /* Center the text */
                margin-top: 20px; /* Space above footer text */
                padding: 10px 0; /* Padding above and below */
                background-color: #222; /* Darker background for footer bottom */
                font-size: 0.8em; /* Font size for footer text */
            }

            /* Responsive design */
            @media (max-width: 768px) {
                .footer {
                    padding: 20px 10px; /* Reduce padding on smaller screens */
                }

                .footer-section {
                    flex: 1 1 100%; /* Stack sections on small screens */
                    margin: 5px 0; /* Reduced margin */
                }
            }
            .footer-section.social-media {
                text-align: center; /* Center-align text and icons */
            }

            .footer-section.social-media h3 {
                margin-bottom: 15px; /* Space below the heading */
                font-size: 1.5em; /* Larger font for heading */
                color: #f0ad4e; /* Color for heading */
                border-bottom: 2px solid #f0ad4e; /* Underline for heading */
                padding-bottom: 5px; /* Padding below heading */
            }

            .social-icons {
                display: flex; /* Flex container for alignment */
                justify-content: center; /* Center the icons */
                gap: 20px; /* Space between icons */
                flex-wrap: wrap; /* Allow icons to wrap in smaller screens */
            }

            .social-icons a {
                display: flex; /* Flexbox for icon and text */
                align-items: center; /* Center items vertically */
                color: white; /* Text color */
                text-decoration: none; /* Remove underline from links */
                transition: transform 0.3s ease; /* Smooth scaling effect */
            }

            .social-icons img {
                width: 40px; /* Set size for social media icons */
                height: auto; /* Maintain aspect ratio */
                margin-left: 8px; /* Space between text and icon */
                transition: transform 0.3s ease; /* Smooth scaling effect for icons */
            }

            .social-icons a:hover {
                transform: scale(1.1); /* Slightly enlarge the link on hover */
            }

            .social-icons a:hover img {
                transform: scale(1.1); /* Slightly enlarge the icon on hover */
            }




        </style>

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

    <!-- Contact Us Section -->
    <div class="contact-container">
        <%
            String error = (String) request.getAttribute("error");
            String success = (String) request.getAttribute("success");

            if (error != null) {
        %>
        <div class="error-message">
            <%= error%>
        </div>
        <%
        } else if (success != null) {
        %>
        <div class="success-message">
            <%= success%>
        </div>
        <%
            }
        %>

        <h1>Contact Us</h1>
        <p>We are here to help. Please fill out the form below, and we will get back to you shortly.</p>
        <form action="contact_us" method="post">
            <div class="form-group">
                <label for="name">Full Name</label>
                <input type="text" id="name" name="name" placeholder="Enter your full name" required>
            </div>
            <div class="form-group">
                <label for="email">Email Address</label>
                <input type="email" id="email" name="email" placeholder="Enter your email" required>
            </div>
            <div class="form-group">
                <label for="phone">Phone Number</label>
                <input type="tel" id="phone" name="phone" placeholder="Enter your phone number" required>
            </div>
            <div class="form-group">
                <label for="message">Your Message</label>
                <textarea id="message" name="message" placeholder="Write your message here..." required></textarea>
            </div>
            <button type="submit">Send Message</button>
        </form>
    </div>

    <div class="footer">
        <div class="footer-container">
            <div class="footer-section social-media" >
                <h3 style="color: white">Follow Us</h3>
                <div class="social-icons" >
                    <a href="https://www.facebook.com" target="_blank" style="color:#f0ad4e ">
                        Facebook
                        <img src="photos/fa.jpg" alt="Facebook" >
                    </a>
                    <a href="https://www.twitter.com" target="_blank"style="color:#f0ad4e ">
                        X
                        <img src="photos/x.jpg" alt="Twitter">
                    </a>
                    <a href="https://www.instagram.com" target="_blank"style="color:#f0ad4e ">
                        Instagram
                        <img src="photos/i.jpg" alt="Instagram">
                    </a>
                    <a href="https://www.linkedin.com" target="_blank" style="color:#f0ad4e ">
                        LinkedIn
                        <img src="photos/li.jpg" alt="LinkedIn">
                    </a>
                </div>
            </div>

            <div class="footer-section links">
                <h3>Links</h3>
                <ul>
                    <li><a href="About_us.jsp">About Us</a></li>
                    <li><a href="home_page.jsp">Home</a></li>
                   
                    <li><a href="privacy_policy.html">Privacy Policy</a></li>
                </ul>
            </div>

            <div class="footer-section contact" style="color:#f0ad4e ">
                <h3>Contact Us</h3>
                <p>Email: UnitedBank@example.com</p>
                <p>Phone: +123 456 7890</p>
                <p>Address: 12th Street,Kanpur,India</p>
            </div>
        </div>
        <div class="footer-bottom">
            &copy; 2024 United Bank. All rights reserved.
        </div>
    </div>

</body>
</html>
