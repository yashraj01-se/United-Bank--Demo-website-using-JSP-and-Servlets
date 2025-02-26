<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Savings Account</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: whitesmoke;
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: flex-start;
                height: 100%;
                text-align: center;
            }

            header {
                background-color: white;
                color: black;
                padding: 1em 0;
                text-align: center;
                display: flex;
                align-items: center;
                justify-content: center;
                gap: 10px;
                width: 100%;
                z-index: 2; /* Ensure header stays on top */
            }

            header h1 {
                margin: 0;
                font-size: 1.8em;
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


            .heading-container {
                position: relative;
                width: 100%;
                text-align: center;
                margin-top: 50px; /* Add margin to prevent overlap */
                z-index: 2; /* Keep the heading on top */
            }

            .heading {
                font-size: 3em;
                font-weight: bold;
                color: #333;
                margin: 2em 0;
                padding: 20px;
                text-transform: uppercase;
                letter-spacing: 2px;
                transition: font-size 0.5s ease, color 0.3s ease;
                position: relative;
                z-index: 2;
            }

            .heading:hover {
                font-size: 4em;
                color: gray; /* Change color on hover */
            }

            .account-section {
                display: flex;
                justify-content: space-between;
                flex-wrap: wrap;
                margin: 2em;
                width: 100%;
                max-width: 1200px;
                gap: 20px;
                padding-top: 20px; /* Adjusted for proper spacing */
            }

            .info {
                background-color: white;
                width: 250px;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                margin: 1em;
                overflow: hidden;
                text-align: center;
                transition: transform 0.3s, box-shadow 0.3s;
                cursor: pointer;
            }

            .info:hover {
                transform: translateY(-10px);
                box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
            }

            .info img {
                width: 100%;
                height: 150px;
                object-fit: fill;
            }

            .info p {
                padding: 0 1em;
                color: #555;
            }

            .info button {
                background-color: black;
                color: white;
                border: none;
                padding: 10px;
                width: 100%;
                font-size: 1.1em;
                cursor: pointer;
                border-bottom-left-radius: 10px;
                border-bottom-right-radius: 10px;
                transition: background-color 0.3s;
            }

            .info button:hover {
                background-color: #333;
            }

            /* Modal Styling */
            .modal {
                display: none;
                position: fixed;
                z-index: 1;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                overflow: auto;
                background-color: rgba(0, 0, 0, 0.4);
                padding-top: 60px;
            }

            .modal-content {
                background-color: white;
                margin: auto;
                padding: 20px;
                border-radius: 10px;
                width: 60%;
                max-width: 600px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
                animation: modalFadeIn 0.3s ease-out;
            }

            .modal-close {
                color: #aaa;
                font-size: 28px;
                font-weight: bold;
                position: absolute;
                top: 10px;
                right: 20px;
                transition: color 0.3s;
            }

            .modal-close:hover,
            .modal-close:focus {
                color: black;
                text-decoration: none;
                cursor: pointer;
            }
            .footer {
                background-color: #2c2c2c; /* Dark background color */
                color: white; /* Text color */
                padding: 40px 20px; /* Padding top and bottom */
                position: relative; /* Positioning for potential overlapping elements */
                width: 120%; /* Full width */
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



            @keyframes modalFadeIn {
                from {
                    opacity: 0;
                    transform: translateY(-30px);
                }
                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }


            .fade-out {
                animation: fadeOut 0.3s ease-out;
            }

            @keyframes fadeOut {
                from {
                    opacity: 1;
                }
                to {
                    opacity: 0;
                }
            }

            /* Responsive styles */
            @media (max-width: 768px) {
                .info {
                    width: 100%; /* Make info cards full width on smaller screens */
                }

                .heading {
                    font-size: 2.5em; /* Smaller heading on mobile */
                }
            }
            /* Carousel Styles */
            .carousel-item img {
                width: 100%;
                height: 530px;
                object-fit: cover;
                margin-top: 20px; /* Space above the carousel images */
                margin-bottom: 20px; /* Space below the carousel images */
            }

            /* Additional space below the carousel */
            .carousel {
                margin-bottom: 30px; /* Increase this value to create more space below the carousel */
            }

            .feature-overlay {
                position: relative;
                overflow: hidden; /* Hide overflow */
                border-radius: 8px; /* Rounded corners */
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* Shadow for depth */
                margin-bottom: 20px; /* Space between features */
            }

            .feature-overlay img {
                width: 100%;
                height: 100%;
                object-fit: fill;
            }

            .overlay {
                position: absolute;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                display: flex;
                align-items: center;
                justify-content: center;
                flex-direction: column;
                background-color: rgba(0, 0, 0, 0.7); /* Semi-transparent background */
                color: white; /* Text color */
                opacity: 0; /* Hidden by default */
                transition: opacity 0.3s; /* Fade-in effect */
            }

            .feature-overlay:hover .overlay {
                opacity: 1; /* Show overlay on hover */
            }

            /* Text Card Styling */
            .info-text-card {
                position: relative;
                background-color: white;
                border-radius: 15px;
                padding: 30px;
                box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
                transition: transform 0.3s ease, box-shadow 0.3s ease;
                margin-bottom: 40px;
            }

            .info-text-card:hover {
                transform: scale(1.05) rotate(2deg);
                box-shadow: 0 15px 40px rgba(0, 0, 0, 0.2);
            }

            /* Hover effect on paragraphs */
            .info-text-card p:hover {
                transform: translateY(-5px);
                color: gray;
            }

            /* Hover effect on headings */
            .info-text-card h4:hover {
                color: gray;
                transform: translateX(10px);
            }

            /* Parallax effect for background */
            .info-text::before {
                content: '';
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: url('images/background.jpg') no-repeat center center;
                background-size: cover;
                transform: scale(1.2);
                z-index: -1;
                transition: transform 0.3s ease;
            }

            /* On hover, parallax effect triggers */
            .info-text:hover::before {
                transform: scale(1);
            }

            /* Reveal Animation for Text */
            .info-text-card .reveal-text {
                opacity: 0;
                transform: translateY(50px);
                transition: all 0.5s ease;
            }

            .info-text-card.reveal .reveal-text {
                opacity: 1;
                transform: translateY(0);
            }


            .savings-account-section {
                display: flex;
                justify-content: space-between; /* Space between text and image */
                align-items:center; /* Align items vertically */
                padding: 30px 30px;
                background-color: #ffffff; /* White background for clarity */
                border-radius: 12px; /* Rounded corners */
                box-shadow: 0 6px 15px rgba(0, 0, 0, 0.15); /* Subtle shadow */
                margin-top: 20px;
            }

            /* Styles for the container to align the content and image side by side */
            .savings-account-section {
                margin-top: 50px;
            }

            .instructions-wrapper {
                display: flex;
                justify-content: space-between;
                background-color: white; /* Optional: gives background to the entire box */
                text-align: left;
                padding: 20px;
                box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
                border-radius: 10px;
            }

            .instructions-content {
                width: 50%; /* Ensures the content takes up half of the container */
            }

            .instructions-content h1 {
                font-size: 2em;
                margin-bottom: 15px;
                color: #333;
                text-align: center;
            }

            .instructions-content ul {
                list-style-type: none;
                padding-left: 0;
            }

            .instructions-content li {
                font-size: 1.1em;
                margin-bottom: 10px;
                color: #555;
            }

            .instructions-image img {
                width: 100%;
                max-width: 400px; /* Adjust to the desired size */
                height: auto;
                border-radius: 10px;
            }


            .create-account-container {
                text-align: center; /* Center the button horizontally */
                margin-top: 20px; /* Add spacing above the button */
            }

            .create-account-btn {
                display: inline-block;
                text-decoration: none;
                background-color: black; /* Primary button color */
                color: white; /* Text color */
                padding: 12px 20px; /* Padding for size */
                font-size: 1.1em; /* Font size */
                font-weight: bold; /* Bold text */
                border-radius: 8px; /* Rounded corners */
                transition: all 0.3s ease-in-out; /* Smooth hover and click effect */
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2); /* Initial shadow for depth */
                position: relative; /* For ripple effect positioning */
                overflow: hidden; /* Hide ripple overflow */
                cursor: pointer;
            }

            /* Hover effect */
            .create-account-btn:hover {
                background-color: gray; /* Darker blue on hover */
                transform: translateY(-2px); /* Slight upward lift */
                box-shadow: 0 6px 15px rgba(0, 0, 0, 0.3); /* Enhanced shadow */
            }

            /* Click (active) effect */
            .create-account-btn:active {
                background-color: black; /* Even darker blue */
                transform: translateY(2px); /* Slight press down */
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2); /* Reduced shadow */
            }

            /* Ripple effect */
            .create-account-btn::after {
                content: '';
                position: absolute;
                top: 50%;
                left: 50%;
                width: 0;
                height: 0;
                background: rgba(255, 255, 255, 0.6); /* White ripple */
                border-radius: 50%; /* Circular ripple */
                transform: translate(-50%, -50%);
                transition: width 0.3s ease, height 0.3s ease, opacity 0.3s ease;
                pointer-events: none; /* Prevent ripple from blocking clicks */
            }

            /* Ripple animation on click */
            .create-account-btn:active::after {
                width: 200%;
                height: 200%;
                opacity: 0; /* Fade out */
            }





            /* Additional spacing for account section if necessary */
            .account-section {
                display: flex;
                justify-content: space-around;
                flex-wrap: wrap;
                margin-top: 20px; /* Space above the account section */
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


        <!-- Heading with Carousel Behind -->
        <div class="heading-container">
            <div class="heading">
                <p>Savings Account</p>
            </div>
        </div>

        <!-- Add a Bootstrap container around account-section -->
        <div class="container">
            <div class="account-section">
                <div class="info">
                    <img src="photos/sa5.jpg" alt="Savings Account">
                    <p>Open a Savings Account today to enjoy high interest rates, no monthly maintenance fees, and easy access to your funds, helping your savings grow effortlessly.</p>
                    <button onclick="openModal('savings')">Learn More</button>
                </div>

                <div class="info">
                    <img src="photos/sg2.jpg" alt="Interest Benefits">
                    <p>Earn competitive interest rates on your Savings Account balance, allowing your money to work harder for you and helping your savings grow steadily over time. </p>
                    <button onclick="openModal('dreams')">Learn More</button>
                </div>

                <div class="info">
                    <img src="photos/sg3.jpg" alt="Fund Transfer">
                    <p>Transfer funds securely between accounts with our instant transfer options, ensuring quick access to your savings and making managing your finances conveniently</p>
                    <button onclick="openModal('funds')">Learn More</button>
                </div>

                <div class="info">
                    <img src="photos/sg4.jpg" alt="Debit Cards">
                    <p>Access your Savings Account anytime, anywhere with United Bank Debit Cards. Enjoy secure, convenient, and easy access to your funds wherever you go..</p>
                    <button onclick="openModal('creditcards')">Learn More</button>
                </div>

                <div class="info">
                    <img src="photos/sg5.jpg" alt="Exclusive Offers">
                    <p>Explore exclusive offers and perks available only to Savings Account holders. United Bank provides valuable benefits, making your banking experience more rewarding.</p>
                    <button onclick="openModal('choices')">Learn More</button>
                </div>
            </div>
        </div>

        <section class="about-us py-5">
            <div class="container">
                <div class="row align-items-center">
                    <!-- About Us Text -->
                    <div class="col-md-6">
                        <h2 class="mb-4"></h2>
                        <p>
                            At United Bank, our Savings Accounts are designed to help you grow your money effortlessly. With attractive interest rates, flexible deposit options, and easy access to your funds, managing your savings has never been easier.
                        </p>
                        <p>
                            Our mission is to empower you to save and achieve your financial goals with secure and customer-friendly banking solutions. Whether you're saving for the future, emergencies, or a special occasion, our Savings Accounts ensure you're always in control.
                        </p>
                    </div>
                    <!-- About Us Image -->
                    <div class="col-md-6">
                        <img src="photos/bank.jpg" alt="About Us Image" class="img-fluid rounded shadow" height="1000" width="1000">
                    </div>
                </div>

                <!-- Core Values Section -->
                <div class="row mt-5 mb-5"> <!-- Added mb-5 for margin-bottom -->
                    <h3 class="text-center mb-4">Our Savings Account Features</h3>

                    <div class="col-md-4 text-center trust-section">
                        <img src="photos/security.jpg" alt="Trust Icon" class="mb-3 rounded-circle">
                        <h5>Security</h5>
                        <p>
                            Your savings are protected with top-notch security measures, ensuring that your funds remain safe and secure.
                        </p>
                    </div>
                    <div class="col-md-4 text-center innovation-section">
                        <img src="photos/interest.jpg" alt="Interest Icon" class="mb-3 rounded-circle" height="250" width="250">
                        <h5>High Interest Rates</h5>
                        <p>
                            Earn higher interest rates with your Savings Account, helping you make the most of your savings.
                        </p>
                    </div>
                    <div class="col-md-4 text-center customer-focus">
                        <img src="photos/access.jpg" alt="Accessibility Icon" class="mb-3 rounded-circle" height="200" width="200">
                        <h5>Easy Accessibility</h5>
                        <p>
                            Access your savings anytime, anywhere with our online banking and mobile app, giving you full control over your funds.
                        </p>
                    </div>
                </div>

                <!-- Dynamic Scrolling Image Section (Carousel) -->
                <div class="carousel slide mt-5" id="carouselExampleAutoplaying" data-bs-ride="carousel">
                    <div class="carousel-inner">
                        <!-- First Image -->
                        <div class="carousel-item active">
                            <img src="photos/s1.jpg" class="d-block w-100" alt="First Image">
                        </div>
                        <!-- Second Image -->
                        <div class="carousel-item">
                            <img src="photos/s2.jpg" class="d-block w-100" alt="Second Image">
                        </div>
                        <!-- Third Image -->
                        <div class="carousel-item">
                            <img src="photos/s3.jpg" class="d-block w-100" alt="Third Image">
                        </div>
                        <!--fourth image-->
                        <div class="carousel-item">
                            <img src="photos/s4.jpg" class="d-block w-100" alt="Fourth Image">
                        </div>
                        <!--fifth image-->
                        <div class="carousel-item">
                            <img src="photos/s5.jpg" class="d-block w-100" alt="Fifth Image">
                        </div>
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>

                <!-- Additional Text-based Information -->
                <div class="info-text">
                    <div class="info-text-card reveal">
                        <h4 class="reveal-text">Why Choose Our Savings Account?</h4>
                        <p class="reveal-text">
                            At United Bank, we believe in providing our clients with the best savings opportunities. Our Savings Account offers excellent interest rates and provides the flexibility to grow your savings with ease.
                        </p>
                    </div>

                    <div class="info-text-card reveal">
                        <h4 class="reveal-text">Our Commitment to Innovation</h4>
                        <p class="reveal-text">
                            United Bank is at the forefront of digital banking, ensuring a seamless and secure experience when managing your Savings Account, wherever you are.
                        </p>
                    </div>

                    <div class="info-text-card reveal">
                        <h4 class="reveal-text">Customer-Centric Services</h4>
                        <p class="reveal-text">
                            We prioritize your financial goals. Our team is here to help you manage your savings with personalized guidance and support.
                        </p>
                    </div>
                </div>

                <!-- Additional Features Section -->
                <div class="row mt-4">
                    <div class="col-md-12 text-center">
                        <h3 class="mb-4"></h3>
                    </div>

                    <div class="col-md-4 text-center">
                        <div class="feature-overlay">
                            <img src="photos/fees.jpg" alt="No Monthly Fees" class="img-fluid">
                            <div class="overlay">
                                <h5>No Monthly Fees</h5>
                                <p>Enjoy no monthly maintenance fees on your Savings Account, helping you save more while growing your wealth.</p>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4 text-center">
                        <div class="feature-overlay">
                            <img src="photos/deposit.jpg" alt="Flexible Deposit Options" class="img-fluid">
                            <div class="overlay">
                                <h5>Flexible Deposit Options</h5>
                                <p>Deposit your savings easily through online banking, mobile app, or at any of our branches.</p>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4 text-center">
                        <div class="feature-overlay">
                            <img src="photos/support.jpg" alt="24/7 Customer Support" class="img-fluid">
                            <div class="overlay">
                                <h5>24/7 Customer Support</h5>
                                <p>Our dedicated customer support team is available anytime to assist you with any questions regarding your Savings Account.</p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="container d-flex align-items- savings-account-section">
                    <!-- Wrapper around content and image for border -->
                    <div class="instructions-wrapper">
                        <div class="instructions-content">
                            <h1 text-align="left">Open Your Savings Account</h1>
                            <ol>
                                <li>Visit the nearest United Bank branch or apply online.</li>
                                <li>Provide valid identification and proof of address.</li>
                                <li>Fill out the application form with your personal details.</li>
                                <li>Choose from a range of account features, including high interest rates and flexible deposit options.</li>
                                <li>Make an initial deposit to activate your account.</li>
                                <li>Receive your account details and debit card instantly.</li>
                            </ol>
                        </div>
                        <div class="instructions-image">
                            <img src="photos/savingh.jpg" alt="Savings Account Image" />
                        </div>
                    </div>
                </div>


                <div class="create-account-container">
                    <a href="create_saving_account.jsp" class="create-account-btn">Create Savings Account</a>
                </div>

        </section>

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









        <!-- Modal -->
        <div id="myModal" class="modal">
            <div class="modal-content">
                <span class="modal-close" onclick="closeModal()">&times;</span>
                <h2 id="modalTitle"></h2>
                <p id="modalContent"></p>
            </div>
        </div>

        <script>
            function openModal(type) {
                const modal = document.getElementById("myModal");
                const title = document.getElementById("modalTitle");
                const content = document.getElementById("modalContent");

                // Set content based on button clicked
                switch (type) {
                    case 'savings':
                        title.innerText = "Savings Account Details";
                        content.innerText = "Our Savings Accounts offer great interest rates, no minimum balance requirements, and easy access to your funds.";
                        break;
                    case 'dreams':
                        title.innerText = "Dreams Loan Details";
                        content.innerText = "Pre-approved loans with quick processing to help you fulfill your dreams.";
                        break;
                    case 'funds':
                        title.innerText = "Fund Transfer Details";
                        content.innerText = "Easy and instant fund transfers, available 24/7 through online banking.";
                        break;
                    case 'creditcards':
                        title.innerText = "Credit Cards Details";
                        content.innerText = "Explore our range of credit cards with exclusive rewards and benefits.";
                        break;
                    case 'choices':
                        title.innerText = "Offers Details";
                        content.innerText = "Discover our latest offers and discounts available with our savings account.";
                        break;
                }


                // Show modal
                modal.style.display = "block";
            }

            function closeModal() {
                const modal = document.getElementById("myModal");
                modal.classList.add("fade-out");
                setTimeout(() => {
                    modal.style.display = "none";
                    modal.classList.remove("fade-out");
                }, 300); // Match the duration of the fade-out animation
            }

            // Close modal when clicking outside of it
            window.onclick = function (event) {
                const modal = document.getElementById("myModal");
                if (event.target === modal) {
                    closeModal();
                }
            };
        </script>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
