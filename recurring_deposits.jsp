<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Recurring Deposit</title>
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

        .navbar .logo-container {
            display: flex; 
            align-items: center;
        }

        .navbar .logo {
            font-size: 1.5em;
            font-weight: bold;
            margin-left: 10px; 
        }

        /* Recurring Deposit Section */
        .rd-section {
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
            margin-top: 100px; /* Adjusted for navbar */
        }

        .rd-section img {
            width: 100%;
            height: auto;
            object-fit: cover;
            max-height: 500px;
        }

        .rd-form-container {
            background-color: rgba(255, 255, 255, 0.9);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            width: 400px;
            height: auto;
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

        .rd-info {
            padding: 20px;
            background-color: white;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            margin-top: 50px;
            border-radius: 10px;
        }

        .features-section {
            background-color: white;
            padding: 20px;
            margin-top: 70px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .feature-item {
            text-align: center;
            margin-bottom: 30px;
        }

        .feature-item img {
            width: 80%;
            max-width: 200px;
        }

        .btn {
            background-color: black;
            width: 100%;
            color: white;
        }

        .btn:hover {
            background-color: gray;
        }

        .btn:active {
            background-color: black;
        }

        .steps-section ul {
            padding-left: 20px;
        }

        .steps-section li {
            margin-bottom: 10px;
        }

        /* Add space between each section */
        .rd-section, .rd-info, .features-section, .steps-section {
            margin-bottom: 50px; /* Added space between sections */
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
        <div class="logo-container">
            <img src="photos/logo.jpg" style="height: 40px;" alt="Logo">
            <div class="logo">United Bank</div>
        </div>
        <div>
            <a href="home_page.jsp">Home</a>
        </div>
    </div>

    <!-- Recurring Deposit Section -->
    <div class="rd-section container">
        <img src="photos/rd1.jpg" alt="Recurring Deposit" class="img-fluid">
        <div class="rd-form-container">
            <h2>Create Recurring Deposit</h2>

            <%-- Check for error or success message --%>
            <% 
                String error = request.getParameter("error");
                String success = request.getParameter("success");
            %>

            <% if (error != null && error.equals("rd_creation_failed")) { %>
                <div class="message error-message">
                    Error while creating Recurring Deposit. Please try again.
                </div>
            <% } %>

            <% if (success != null && success.equals("rd_created")) { %>
                <div class="message success-message">
                    Successfully created your Recurring Deposit. Thank you for choosing us!.For further, please visit our nearest branch.
                </div>
            <% } %>

            <form action="recurring_deposits" method="POST" onsubmit="return validateRDForm();">
                <u><h6 style="text-align: center;color: red">Only for Saving Account Holder</h6></u>
                
                <!-- Account Number (Generated) -->
                <div class="form-group">
                    <label for="accountNumber">Account Number</label>
                    <input type="text" id="accountNumber" name="accountNumber" placeholder="enter Account Number"  required>
                </div>
                
                <!-- Full Name -->
                <div class="form-group">
                    <label for="rdName">Full Name</label>
                    <input type="text" id="rdName" name="rdName" placeholder="Enter your full name" required>
                </div>

                <!-- Amount -->
                <div class="form-group">
                    <label for="amount">Monthly Deposit Amount</label>
                    <input type="number" id="amount" name="amount" placeholder="Enter the monthly deposit amount" required>
                </div>

                <!-- Duration -->
                <div class="form-group">
                    <label for="duration">Deposit Duration</label>
                    <select id="duration" name="duration" required>
                        <option value="1">1 Year</option>
                        <option value="2">2 Years</option>
                        <option value="3">3 Years</option>
                        <option value="5">5 Years</option>
                    </select>
                </div>

                <!-- Submit Button -->
                <button type="submit" class="submit-btn">Create Recurring Deposit</button>
            </form>
        </div>
    </div>

    <!-- Recurring Deposit Information Section -->
    <div class="rd-info container">
        <u><h2 class="text-center mb-4">What is a Recurring Deposit?</h2></u>
        <p>A Recurring Deposit (RD) is a type of deposit where you contribute a fixed sum every month for a specified period, earning interest at a fixed rate. It?s an excellent way to save for the future while enjoying guaranteed returns on your monthly contributions.</p>
        <ul>
            <li>Save a fixed amount every month and earn interest on your contributions.</li>
            <li>Guaranteed returns at the time of maturity.</li>
            <li>Flexible deposit tenures from 1 to 5 years.</li>
            <li>Option to automate your monthly contributions.</li>
        </ul>
    </div>

    <!-- Steps to Create Recurring Deposit -->
    <div class="steps-section container">
        <h2 class="text-center mb-4">Steps to Create a Recurring Deposit</h2>
        <ul>
            <li>Step 1: Fill in your full name and monthly deposit amount.</li>
            <li>Step 2: Choose the desired deposit duration (1, 2, 3, or 5 years).</li>
            <li>Step 3: Click on the "Create Recurring Deposit" button to finalize your RD.</li>
            <li>Step 4: Receive confirmation of your successful RD creation.</li>
        </ul>
    </div>

    <!-- Features of Recurring Deposit Section -->
    <div class="features-section container">
        <u><h2 class="text-center mb-4">Features of Recurring Deposit</h2></u>
        <div class="row">
            <div class="col-md-4 feature-item">
                <img src="photos/rd2.jpg" alt="Guaranteed Returns">
                <h4>Guaranteed Returns</h4>
                <p>Your monthly deposits earn a fixed rate of interest, ensuring secure returns.</p>
            </div>
            <div class="col-md-4 feature-item">
                <img src="photos/rd3.jpg" alt="Flexible Contribution">
                <h4>Flexible Contribution</h4>
                <p>Set up an amount that you can comfortably contribute every month.</p>
            </div>
            <div class="col-md-4 feature-item">
                <img src="photos/rd4.jpg" alt="Secure Investment">
                <h4>Secure Investment</h4>
                <p>Your investment is risk-free, with guaranteed returns on maturity.</p>
            </div>
        </div>
    </div>

    <!-- FAQ Section -->
    <div class="faq-section container">
        <h2>Frequently Asked Questions (FAQs)</h2>
        <div class="faq-item">
            <h5 class="faq-question">1. What is the minimum amount required for a Recurring Deposit?</h5>
            <p class="faq-answer">Answer: The minimum deposit amount for a Recurring Deposit is $500 per month.</p>
        </div>
        <div class="faq-item">
            <h5 class="faq-question">2. Can I withdraw my Recurring Deposit before maturity?</h5>
            <p class="faq-answer">Answer: Yes, you can withdraw your RD before maturity, but penalties may apply for early withdrawal.</p>
        </div>
        <div class="faq-item">
            <h5 class="faq-question">3. How is the interest paid on a Recurring Deposit?</h5>
            <p class="faq-answer">Answer: The interest is paid at the end of the maturity period, or as per your chosen terms.</p>
        </div>
        <div class="faq-item">
            <h5 class="faq-question">4. Can I take a loan against my Recurring Deposit?</h5>
            <p class="faq-answer">Answer: Yes, you can avail a loan against your Recurring Deposit after a certain period.</p>
        </div>
    </div>

    <!-- Privacy Policy Section -->
    <div class="container mt-5">
        <u><h2 class="text-center mb-4">Privacy Policy</h2></u>
        <p>Your privacy is important to us. At United Bank, we take the security of your personal information seriously. We ensure that your data is protected and used only for purposes related to your account.</p>
        <p style="text-align: center;">For more details, read our full privacy policy: <a href="privacy_policy.html"style="color: black">Click Here</a>.</p>

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
    
    <!-- Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        function validateRDForm() {
            var name = document.getElementById("rdName").value;
            var amount = document.getElementById("amount").value;
            var duration = document.getElementById("duration").value;

            if (!name || !amount || !duration) {
                alert("Please fill in all fields.");
                return false;
            }

            if (amount <= 0) {
                alert("Please enter a valid deposit amount.");
                return false;
            }

            return true;
        }
    </script>
</body>
</html>
