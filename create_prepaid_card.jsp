<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Prepaid Card Application - United Bank</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: whitesmoke;
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
                z-index: 10;
            }

            .navbar .logo-container {
                display: flex;
                align-items: center;
            }

            .navbar .logo-container img {
                height: 40px;
                margin-right: 10px;
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
                margin-right: 45px;
            }

            .navbar a:hover {
                background-color: gainsboro;
                border-radius: 5px;
            }

            /* Form Section */
            .form-section {
                margin-top: 120px; /* Increased top margin to avoid overlap with navbar */
                padding: 4em 2em;
                text-align: center;
                background-color: #f9f9f9;
            }

            /* Box with Shadow */
            .form-section form {
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                max-width: 600px;
                margin: 0 auto;
                padding: 2em;
                background-color: white; /* Background for the form */
                border-radius: 10px; /* Rounded corners */
                box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1); /* Shadow effect */
            }

            /* Heading and Text */
            h2, h3 {
                font-size: 2em;
                margin-bottom: 1em;
            }

            h3 {
                font-size: 1.5em;
            }

            /* Form Inputs and Buttons */
            .form-section input,
            .form-section select,
            .form-section button {
                margin: 10px;
                padding: 0.8em;
                font-size: 1em;
                width: 100%;
                max-width: 400px;
                border: 1px solid #ccc;
                border-radius: 5px;
            }

            .form-section button {
                background-color: black;
                color: white;
                border: none;
                cursor: pointer;
                transition: background-color 0.3s;
            }

            .form-section button:hover {
                background-color: gray;
            }

            /* Error and Success Message Styles */
            .message {
                padding: 10px;
                margin-bottom: 20px;
                border-radius: 5px;
                text-align: center;
                font-size: 1rem;
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
    </head>
    <body>

        <!-- Navbar -->
        <div class="navbar">
            <div class="logo-container">
                <img src="photos/logo.jpg" style="height: 40px;" alt="Logo">
                <div class="logo">United Bank</div>
            </div>
            <div>
                <a href="home_page.jsp">Home</a>
            </div>
        </div>

        <!-- Form Section -->
        <div class="form-section">
            <u><h2>Apply for United Bank's Prepaid Card </h2></u>
            <p>Fill in your details to apply for your prepaid card.</p>

            <%
                String error = request.getParameter("error");
                String success = request.getParameter("success");
            %>

            <% if (error != null && error.equals("not_inserted")) { %>
            <div class="message error-message">
                Error while form handling,please try again.
            </div>
            <% } %>

            <% if (error != null && error.equals("not")) { %>
            <div class="message error-message">
                Not Eligible for Prepaid Card.
            </div>
            <% } %>

            <% if (success != null && success.equals("ok")) { %>
            <div class="message success-message">
                Successfully entered your Query.Visit our nearest branch for further details.
            </div>
            <% } %>
            <% if (error != null && error.equals("invalid")) { %>
            <div class="message error-message">
                Provide valid Credentials 
            </div>
            <% }%>


            <!-- Application Form -->
            <form action="create_prepaid_card" method="post">
                <!-- Personal Details -->
                <h3>Personal Details</h3>
                <input type="text" name="fullName" placeholder="Full Name" required />
                <input type="email" name="email" placeholder="Email Address" required />
                <input type="text" name="phone" placeholder="Phone Number" required />
                <input type="text" name="address" placeholder="Permanent Address" required />

                <!-- Card Type -->
                <h3>Card Type</h3>
                <select name="cardType" required>
                    <option value="Standard Prepaid Card">Platinum Prepaid Card</option>
                    <option value="Premium Prepaid Card">Gold Prepaid Card</option>
                    <option value="Travel Prepaid Card">Travel Prepaid Card</option>

                </select>

                <!-- Financial Information -->
                <h3>Financial Information</h3>
                <input type="number" name="income" placeholder="Monthly Income (in INR)" required />
                <input type="number" name="creditScore" placeholder="Credit Score" required />

                <!-- Submit Button -->
                <button type="submit">Submit Application</button>
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
                    <li><a href="#">Services</a></li>
                    <li><a href="contact_us.jsp">Contact</a></li>
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
