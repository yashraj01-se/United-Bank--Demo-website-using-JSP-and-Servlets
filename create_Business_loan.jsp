<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Apply for Business Loan</title>
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
            width: 75%;
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

        /* FAQs and Privacy Policy Section */
        .faq-section, .privacy-section {
            padding: 20px;
            margin-top: 20px;
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }

        .faq-section h3, .privacy-section h3 {
            text-align: center;
            margin-bottom: 20px;
            color: black;
        }

        .faq {
            margin-bottom: 15px;
        }

        .faq h5 {
            margin: 0;
            cursor: pointer;
            color: black;
        }

        .faq p {
            display: none;
            margin: 5px 0 0 0;
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
        <img src="photos/opl1.jpg" alt="Business Loan" class="img-fluid">
        <div class="form-container">
            <h2>Apply for an Business Loan</h2>
               <%-- Check for error or success message --%>
            <% 
                String error = request.getParameter("error");
                String success = request.getParameter("success");
            %>

            <% if (error != null && error.equals("loan_application_failed")) { %>
                <div class="message error-message">
                    Error while applying for the loan. Please try again.
                </div>
            <% } %>
            <% if (error != null && error.equals("user_verification_failed")) { %>
                <div class="message error-message">
                   Please enter Valid Credentials.
                </div>
            <% } %>
            

            <% if (success != null && success.equals("loan_application_success")) { %>
                <div class="message success-message">
                    Your loan application has been submitted successfully. After verifying your details , we will contact you shortly.
                </div>
            <% } %>
            <!-- Form to apply for Business Loan -->
<form action="create_Business_loan" method="POST" onsubmit="return validateForm()">
    <div class="form-group">
        <label for="name">Full Name</label>
        <input type="text" id="name" name="name" required>
    </div>
    <div class="form-group">
        <label for="businessName">Business Name</label>
        <input type="text" id="businessName" name="businessName" required>
    </div>
    <div class="form-group">
        <label for="address">Business Address</label>
        <textarea id="address" name="address" required></textarea>
    </div>
    <div class="form-group">
        <label for="email">Email</label>
        <input type="email" id="email" name="email" required>
    </div>
    <div class="form-group">
        <label for="loanAmount">Loan Amount</label>
        <input type="number" id="loanAmount" name="loanAmount" required>
    </div>
    <div class="form-group">
        <label for="businessType">Business Type</label>
        <select id="businessType" name="businessType" required>
            <option value="">Select Business Type</option>
            <option value="Retail">Retail</option>
            <option value="Manufacturing">Manufacturing</option>
            <option value="Services">Services</option>
            <option value="Agriculture">Agriculture</option>
            <option value="Technology">Technology</option>
            <option value="Healthcare">Healthcare</option>
            <option value="Construction">Construction</option>
            <option value="Real Estate">Real Estate</option>
            <option value="Education">Education</option>
            <option value="Hospitality">Hospitality</option>
            <option value="Transport">Transport</option>
        </select>
    </div>
    <div class="form-group">
        <label for="businessVintage">Years in Business</label>
        <input type="number" id="businessVintage" name="businessVintage" required>
    </div>
    <div class="form-group">
        <label for="annualRevenue">Annual Revenue (in USD)</label>
        <input type="number" id="annualRevenue" name="annualRevenue" required>
    </div>
    <div class="form-group">
        <label for="loanPurpose">Loan Purpose</label>
        <textarea id="loanPurpose" name="loanPurpose" required></textarea>
    </div>

    <button type="submit" class="submit-btn">Submit Application</button>
</form>
        </div>
    </div>
            
            
            <!-- FAQ Section -->
<div class="container faq-section">
    <h3>Frequently Asked Questions (FAQ)</h3>
    <div class="faq">
        <h5 onclick="toggleFAQ(this)">What is the minimum revenue required for a business loan?</h5>
        <p>We typically require a minimum annual revenue of $50,000 for small businesses to qualify for a business loan.</p>
    </div>
    <div class="faq">
        <h5 onclick="toggleFAQ(this)">How long does it take to approve a business loan?</h5>
        <p>The approval process can take between 5 to 10 business days, depending on the completeness of your application and documentation.</p>
    </div>
    <div class="faq">
        <h5 onclick="toggleFAQ(this)">Can I apply for a business loan if I have a new business?</h5>
        <p>Yes, new businesses can apply for loans. We offer special loan programs for startups and entrepreneurs. Please contact us for more details.</p>
    </div>
    <div class="faq">
        <h5 onclick="toggleFAQ(this)">What documents do I need to submit for a business loan?</h5>
        <p>You will need to submit your business plan, tax returns, financial statements, and proof of business registration.</p>
    </div>
    <div class="faq">
        <h5 onclick="toggleFAQ(this)">What is the maximum loan amount I can apply for?</h5>
        <p>The maximum loan amount depends on your business revenue and credit history. We can offer loans up to $500,000 for qualifying businesses.</p>
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
                    <li><a href="home_page.jsp">Home</a></li>
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
    // Function to toggle the visibility of FAQ answers
    function toggleFAQ(element) {
        var answer = element.nextElementSibling;
        if (answer.style.display === "block") {
            answer.style.display = "none";
        } else {
            answer.style.display = "block";
        }
    }
</script>


    <!-- Scripts -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
