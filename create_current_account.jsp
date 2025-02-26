<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Current Account</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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

        /* Section with Image and Form */
        .form-section {
            display: flex;
            justify-content: center; /* Center the section */
            align-items: center;
            height: auto;
            padding: 20px;
            margin-top: 80px; /* Adjusted for the navbar */
        }

        .form-section img {
            width: 100%;
            height: auto;
            object-fit: cover;
            max-height: 500px;
        }

        .form-container {
            background-color: rgba(255, 255, 255, 0.9);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            width: 400px;
            height: auto;
            margin-left: -20px;
            overflow: hidden;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: black;
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            font-size: 0.85rem;
        }

        input, select, textarea {
            width: 90%;
            padding: 8px;
            font-size: 0.85rem;
            border: none;
            border-bottom: 1px solid #ccc;
            outline: none;
            margin-top: 5px;
        }

        input:focus, select:focus, textarea:focus {
            border-bottom: 1px solid #007bff;
        }

        .submit-btn {
            width: 100%;
            padding: 10px;
            background-color: black;
            color: white;
            font-size: 0.9rem;
            font-weight: bold;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .submit-btn:hover {
            background-color: gray;
        }

        .submit-btn:active {
            background-color: black;
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

        /* Benefits Section */
        .benefits-section {
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
            margin-bottom: 20px;
        }

        .benefits-section h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        .benefit-item {
            margin-bottom: 15px;
        }

        .benefit-item i {
            color: #007bff;
            margin-right: 10px;
        }

        /* FAQ Section */
        .faq-section {
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
            margin-bottom: 20px;
        }

        .faq-section h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        .faq-item {
            margin-bottom: 15px;
        }

        .faq-question {
            font-weight: bold;
            margin-bottom: 15px;
        }

        .faq-answer {
            margin-top: 5px;
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

    <div class="navbar">
        <div class="logo">
            <img src="photos/logo.jpg" style="height: 40px;" alt="Logo">
            United Bank
        </div>
        <div>
            <a href="home_page.jsp">Home</a>
        </div>
    </div>

    <!-- Section with Image and Form -->
    <div class="form-section container">
        <img src="photos/cuac.jpg" alt="Current Account" class="img-fluid">
        <div class="form-container">
            <h2>Create Current Account</h2>
            <%-- Check for error or success message --%>
            <% 
                String error = request.getParameter("error");
                String success = request.getParameter("success");
            %>

            <% if (error != null && error.equals("account_creation_failed")) { %>
                <div class="message error-message">
                    Error while creating Account. Please try again.
                </div>
            <% } %>

            <% if (success != null && success.equals("account_created")) { %>
                <div class="message success-message">
                    Successfully entered your Query. Visit our nearest branch for further details.
                </div>
            <% } %>
             <% if (error != null && error.equals("information_mismatched")) { %>
                <div class="message error-message">
                    Provide valid Credentials.
                </div>
            <% } %>
            <form action="create_current_account" method="POST" onsubmit="return validateForm();">
                <!-- Account Number (Generated) -->
                <div class="form-group">
                    <label for="accountNumber">Account Number</label>
                    <input type="text" id="accountNumber" name="accountNumber" required readonly>
                </div>
                
                <!-- Customer ID (Generated) -->
                <div class="form-group">
                    <label for="customerId">Customer ID</label>
                    <input type="text" id="customerId" name="customerId" required readonly>
                </div>

                <!-- Full Name -->
                <div class="form-group">
                    <label for="name">Full Name</label>
                    <input type="text" id="name" name="name" placeholder="Enter your full name" required>
                </div>

                <!-- Email -->
                <div class="form-group">
                    <label for="email">Email Address</label>
                    <input type="email" id="email" name="email" placeholder="Enter your email" required>
                </div>

                <!-- Phone -->
                <div class="form-group">
                    <label for="phone">Phone Number</label>
                    <input type="tel" id="phone" name="phone" placeholder="Enter your phone number" required>
                </div>

                <!-- Address -->
                <div class="form-group">
                    <label for="address">Address</label>
                    <textarea id="address" name="address" placeholder="Enter your address" rows="2" required></textarea>
                </div>

                <!-- Date of Birth -->
                <div class="form-group">
                    <label for="dob">Date of Birth</label>
                    <input type="date" id="dob" name="dob" required>
                </div>

                <!-- Account Type -->
                <div class="form-group">
                    <label for="accountType">Account Type</label>
                    <select id="accountType" name="accountType" required>
                        <option value="current">Current Account</option>
                    </select>
                </div>

                <!-- National ID -->
                <div class="form-group">
                    <label for="nationalId">National ID</label>
                    <input type="text" id="nationalId" name="nationalId" placeholder="Enter your National ID" required>
                </div>

                <!-- Submit Button -->
                <button type="submit" class="submit-btn">Create Account</button>
            </form>
        </div>
    </div>
            
            <div class="container mt-5">
    <u><h2 class="text-center mb-4">Benefits of a Current Account</h2></u>
    <div class="row">
        <div class="col-md-4">
            <div class="card shadow-sm mb-4">
                <div class="card-body">
                    <h5 class="card-title">Easy Access to Funds</h5>
                    <p class="card-text">Enjoy instant access to your funds anytime, through ATMs, online banking, or checks.</p>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card shadow-sm mb-4">
                <div class="card-body">
                    <h5 class="card-title">No Restrictions on Transactions</h5>
                    <p class="card-text">Make unlimited withdrawals and deposits without any restrictions, making it ideal for daily transactions.</p>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card shadow-sm mb-4">
                <div class="card-body">
                    <h5 class="card-title">Overdraft Facility</h5>
                    <p class="card-text">A current account often provides an overdraft facility, allowing you to withdraw more than your account balance when needed.</p>
                </div>
            </div>
        </div>
    </div>
</div>

    <!-- Customer Testimonials Section -->
    <div class="container mt-5">
        <u><h2 class="text-center mb-4">What Our Customers Say</h2></u>
        <div class="row">
            <div class="col-md-4 mb-4">
                <div class="card shadow-sm">
                    <div class="card-body">
                        <p class="card-text">"Opening a current account at United Bank was a simple process, and the staff was very helpful!" - John D.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 mb-4">
                <div class="card shadow-sm">
                    <div class="card-body">
                        <p class="card-text">"I opened a current account online, and it was quick and easy. Great service!" - Sarah M.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 mb-4">
                <div class="card shadow-sm">
                    <div class="card-body">
                        <p class="card-text">"United Bank?s current accounts have flexible features and great customer support!" - Maria P.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- FAQ Section -->
    <div class="faq-section container">
        <h2>Frequently Asked Questions(FAQs)</h2>
        <div class="faq-item">
            <h5 class="faq-question">1. What documents are required to open a current account?</h5>
            <p class="faq-answer">Answer: You will need to provide a valid ID (National ID or Passport), proof of address (utility bill or lease), and a minimum deposit amount.</p>
        </div>
        <div class="faq-item">
            <h5 class="faq-question">2. Is there a minimum balance requirement?</h5>
            <p class="faq-answer">Answer: Yes, a minimum balance of $100 is required to maintain your current account.</p>
        </div>
        <div class="faq-item">
            <h5 class="faq-question">3. Can I open an account online?</h5>
            <p class="faq-answer">Answer: Yes, you can open a current account online through our website.</p>
        </div>
        <div class="faq-item">
            <h5 class="faq-question">4. What are the benefits of a current account?</h5>
            <p class="faq-answer">Answer: A current account provides easy access to your funds, the ability to write checks, and it is ideal for managing everyday transactions.</p>
        </div>
    </div>
    
     <!-- Privacy Policy Section -->
    <div class="container mt-5">
        <u><h2 class="text-center mb-4">Privacy Policy</h2></u>
        <p>Your privacy is important to us. At United Bank, we take the security of your personal information seriously. We ensure that your data is protected and used only for purposes related to your account.</p>
        <p style="text-align: center;">For more details, read our full privacy policy: <a href="privacy_policy.html" style="color: black">Click Here</a>.</p>
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

    <script>
        // Function to generate a random 10-digit account number
        function generateAccountNumber() {
            const accountNumber = Math.floor(1000000000 + Math.random() * 9000000000);
            document.getElementById("accountNumber").value = accountNumber; // Assign value to the input field
        }

        // Function to generate a random 8-digit customer ID
        function generateCustomerId() {
            const customerId = Math.floor(10000000 + Math.random() * 90000000);
            document.getElementById("customerId").value = customerId; // Assign value to the input field
        }

        // Call the functions to generate account number and customer ID when the page loads
        window.onload = function () {
            generateAccountNumber();
            generateCustomerId();
        };

        // Form validation function
        function validateForm() {
            const name = document.getElementById("name").value;
            const email = document.getElementById("email").value;
            const phone = document.getElementById("phone").value;
            const nationalId = document.getElementById("nationalId").value;

            // Simple validation example
            if (name === "" || email === "" || phone === "" || nationalId === "") {
                alert("Please fill in all required fields.");
                return false;
            }

            return true;
        }
    </script>

</body>
</html>
