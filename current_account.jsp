<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Current Account</title>
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

            /* Wrapper around content and image for border */
            .instructions-wrapper {
                display: flex;
                border:0.5px ; /* Green border around both text and image */
                padding: 20px;
                border-radius: 8px; /* Rounded corners for the box */
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1); /* Optional: subtle shadow for depth */
            }

            /* Content styling */
            .instructions-content {
                flex: 1; /* Occupy equal space for text */
                margin-right: 20px; /* Space between text and image */
            }

            .instructions-content h1 {
                font-size: 1.8em;
                color: #212529;
                font-weight: bold;
                margin-bottom: 30px;
            }

            .instructions-content ul {
                margin: 0;
            }

            .instructions-content ul li {
                font-size: 1.1em;
                line-height: 1.6;
                color: #495057;
                margin-bottom: 10px;
                position: relative;
                padding-left: 25px;
            }

            .instructions-content ul li::before {
                font-size: 1.2em;
                color: #28a745;
                position: absolute;
                left: 0;
                top: 0;
            }

            /* Image styling */
            .instructions-image {
                flex: 1; /* Occupy equal space for image */
                text-align: right; /* Align the image to the right */
            }

            .instructions-image img {
                max-width: 100%; /* Ensure image doesn't overflow */
                border-radius: 8px; /* Rounded corners for image */
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2); /* Subtle shadow for image */
                object-fit: cover; /* Maintain aspect ratio of the image */
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
                <p>Current Account</p>
            </div>
        </div>

        <!-- Add a Bootstrap container around account-section -->
        <div class="container">
            <div class="account-section">
                <div class="info">
                    <img src="photos/ca5.jpg" alt="Current Account">
                    <p>Open a Current Account today and enjoy hassle-free banking with no minimum balance requirements, easy access to your funds, and free transactions.</p>
                    <button onclick="openModal('current')">Learn More</button>
                </div>

                <div class="info">
                    <img src="photos/ca6.jpg" alt="Overdraft Protection">
                    <p>Stay secure with overdraft protection on your Current Account. United Bank ensures you're always covered, even when funds are low.Bank is there for you everytime.</p>
                    <button onclick="openModal('overdraft')">Learn More</button>
                </div>

                <div class="info">
                    <img src="photos/ca7.jpg" alt="Fund Transfer">
                    <p>Transfer funds quickly and securely between accounts with our instant payment solutions.Does not depend upon distance, United bank always get you covered</p>
                    <button onclick="openModal('funds')">Learn More</button>
                </div>

                <div class="info">
                    <img src="photos/ca8.jpg" alt="Debit Cards">
                    <p>Access your Current Account anytime, anywhere with United Bank Debit Cards. Convenient and secure.Shopping or traveling do not have to think before spending. </p>
                    <button onclick="openModal('debitcards')">Learn More</button>
                </div>

                <div class="info">
                    <img src="photos/ca9.jpg" alt="Exclusive Offers">
                    <p>Explore exclusive offers and perks available only to Current Account holders. United Bank brings you a range of benefits.Customers can avail a wide variety of services</p>
                    <button onclick="openModal('offers')">Learn More</button>
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
                            At United Bank, our Current Accounts are designed to provide you with a flexible and convenient way to manage your everyday finances. We prioritize your financial ease and offer features that ensure seamless access to your funds whenever you need them.

                            Our mission is to empower you to manage your money effortlessly with secure and customer-friendly banking solutions. With features such as no minimum balance requirements, instant fund transfers, overdraft protection, and easy access via online banking and mobile apps, managing your finances has never been more convenient. Whether it's for daily transactions or business needs, our Current Accounts ensure you're always in control.

                        </p>
                        <p>
                            Our mission is to help you manage your finances effortlessly through secure and customer-friendly banking solutions. With features like online banking, easy fund transfers, and overdraft protection, managing your Current Account has never been easier. Whether for personal or business use, we provide the tools you need to stay in control of your everyday financial activities.


                        </p>
                    </div>
                    <!-- About Us Image -->
                    <div class="col-md-6">
                        <img src="photos/bank.jpg" alt="About Us Image" class="img-fluid rounded shadow" height="1000" width="1000">
                    </div>
                </div>

                <!-- Core Values Section -->
                <div class="row mt-5 mb-5"> <!-- Added mb-5 for margin-bottom -->
                    <h3 class="text-center mb-4">Our Current Account Features</h3>

                    <div class="col-md-4 text-center trust-section">
                        <img src="photos/security.jpg" alt="Trust Icon" class="mb-3 rounded-circle">
                        <h5>Security</h5>
                        <p>
                            Your current account is protected with top-notch security measures, ensuring that your funds are safe with every transaction.
                        </p>
                    </div>
                    <div class="col-md-4 text-center innovation-section">
                        <img src="photos/interest.jpg" alt="Overdraft Icon" class="mb-3 rounded-circle" height="250" width="250">
                        <h5>Overdraft Protection</h5>
                        <p>
                            Stay covered with overdraft protection, ensuring you're never stranded with insufficient funds when you need them.
                        </p>
                    </div>
                    <div class="col-md-4 text-center customer-focus">
                        <img src="photos/access.jpg" alt="Accessibility Icon" class="mb-3 rounded-circle" height="200" width="200">
                        <h5>Easy Accessibility</h5>
                        <p>
                            Access your funds anytime, anywhere with our seamless online banking and mobile app, making managing your finances easy.
                        </p>
                    </div>
                </div>



                <!-- Dynamic Scrolling Image Section (Carousel) -->
                <div class="carousel slide mt-5" id="carouselExampleAutoplaying" data-bs-ride="carousel">
                    <div class="carousel-inner">
                        <!-- First Image -->
                        <div class="carousel-item active">
                            <img src="photos/cur.jpg" class="d-block w-100" alt="First Image">
                        </div>
                        <!-- Second Image -->
                        <div class="carousel-item">
                            <img src="photos/cur2.jpg" class="d-block w-100" alt="Second Image">
                        </div>
                        <!-- Third Image -->
                        <div class="carousel-item">
                            <img src="photos/cur3.jpg" class="d-block w-100" alt="Third Image">
                        </div>
                        <!--fourth image-->
                        <div class="carousel-item">
                            <img src="photos/ca14.jpg" class="d-block w-100" alt="Fourth Image">
                        </div>
                        <!--fifth image-->
                        <div class="carousel-item">
                            <img src="photos/cur4.jpg" class="d-block w-100" alt="Fifth Image">
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
                        <h4 class="reveal-text">Why Choose Our Current Account?</h4>
                        <p class="reveal-text">
                            At United Bank, we believe in providing our clients with the flexibility and tools they need to manage their finances with ease. Our Current Account is designed to offer you smooth and secure access to your funds, with no minimum balance requirements and easy transaction options.
                        </p>
                    </div>

                    <div class="info-text-card reveal">
                        <h4 class="reveal-text">Our Commitment to Innovation</h4>
                        <p class="reveal-text">
                            United Bank is at the forefront of digital banking innovation, providing you with the latest technology to ensure secure and efficient management of your Current Account. Our mobile app, online banking platform, and digital services are tailored to offer you a seamless banking experience, wherever you are.
                        </p>
                    </div>

                    <div class="info-text-card reveal">
                        <h4 class="reveal-text">Customer-Centric Services</h4>
                        <p class="reveal-text">
                            We prioritize your needs above all else. Our dedicated team is here to provide personalized assistance and guidance, ensuring that your Current Account is managed in a way that suits your financial goals. Whether it's managing transactions or accessing support, we're here to help.
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
                                <p>Enjoy no monthly maintenance fees on your Current Account, helping you save more while managing your finances.</p>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4 text-center">
                        <div class="feature-overlay">
                            <img src="photos/deposit.jpg" alt="Flexible Deposit Options" class="img-fluid">
                            <div class="overlay">
                                <h5>Flexible Deposit Options</h5>
                                <p>Choose how you want to deposit: online, through our app, or at a branch.</p>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4 text-center">
                        <div class="feature-overlay">
                            <img src="photos/support.jpg" alt="24/7 Customer Support" class="img-fluid">
                            <div class="overlay">
                                <h5>24/7 Customer Support</h5>
                                <p>Our dedicated customer support team is here to help you whenever you need assistance.</p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="container d-flex align-items- current-account-section">
                    <!-- Wrapper around content and image for border -->
                    <div class="instructions-wrapper">
                        <div class="instructions-content">
                            <h1>Open Your Current Account</h1>
                            <ul>
                                <li>Visit the nearest United Bank branch or apply online.</li>
                                <li>Provide valid identification and proof of address.</li>
                                <li>Fill out the application form with your personal details.</li>
                                <li>Choose from a range of account features, such as overdraft protection and unlimited transactions.</li>
                                <li>Make an initial deposit to activate your account.</li>
                                <li>Receive your account details and debit card instantly.</li>
                            </ul>
                        </div>
                        <div class="instructions-image">
                            <img src="photos/curr.jpg" alt="Current Account Image" />
                        </div>
                    </div>
                </div>


                <div class="create-account-container">
                    <a href="create_current_account.jsp" class="create-account-btn">Create Current Account</a>
                </div>





        </section>


        <!-- Modal -->
        <div id="myModal" class="modal">
            <div class="modal-content">
                <span class="modal-close" onclick="closeModal()">&times;</span>
                <h2 id="modalTitle"></h2>
                <p id="modalContent"></p>
            </div>
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
            function openModal(type) {
                const modal = document.getElementById("myModal");
                const title = document.getElementById("modalTitle");
                const content = document.getElementById("modalContent");

                // Set content based on button clicked for Current Account
                switch (type) {
                    case 'current':
                        title.innerText = "Current Account Details";
                        content.innerText = "Our Current Accounts offer flexible access to your funds, unlimited transactions, and zero maintenance fees. Ideal for day-to-day banking needs.";
                        break;
                    case 'overdraft':
                        title.innerText = "Overdraft Protection";
                        content.innerText = "Enjoy overdraft protection to help cover unexpected expenses. Your account will remain in good standing even if you exceed your balance.";
                        break;
                    case 'transfers':
                        title.innerText = "Fund Transfer Details";
                        content.innerText = "Perform easy and instant fund transfers to any bank account anytime, with secure and quick online banking solutions.";
                        break;
                    case 'debitcards':
                        title.innerText = "Debit Cards Details";
                        content.innerText = "Get a debit card for easy access to your funds at ATMs and online, with no hidden charges and full control over your spending.";
                        break;
                    case 'offers':
                        title.innerText = "Online Banking Features";
                        content.innerText = "Manage your Current Account online anytime with our easy-to-use platform. Check balances, make payments, and transfer funds all at your convenience.";
                        break;
                }

                // Show modal with fade-in effect
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
