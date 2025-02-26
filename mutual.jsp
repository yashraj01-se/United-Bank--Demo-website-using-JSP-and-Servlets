<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Mutual Funds</title>
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
              
                overflow: hidden;
                text-align: center;
                transition: transform 0.3s, box-shadow 0.3s;
                cursor: pointer;
                margin-right: 80px;
                margin-left: 50px;
                margin-bottom: 50px;
            }

            .info:hover {
                transform: translateY(-10px);
                box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
            }

            .info img {
                width: 100%;
                padding: 0.5em;
                height: 150px;
                
                border-bottom-left-radius: 20px;
                border-bottom-right-radius: 20px;
                border-top-left-radius: 20px;
                border-top-right-radius: 20px;
            }

            .info p {
                margin: 0; /* Removes any default margin that might add extra space */
                padding: 0.5em; /* Ensures consistent padding around the text */
                color: #555;
                text-align: center; /* Aligns the text to the left for better readability */
            }

            .info button {
                background-color: black;
                color: white;
                border: none;
                padding: 10px;
                width: 100%;
                margin-right: -15px;
                margin-left: -15px;
                font-size: 1.1em;
                cursor: pointer;
                border-bottom-left-radius: 10px;
                border-bottom-right-radius: 10px;
                border-top-left-radius: 10px;
                border-top-right-radius: 10px;
                transition: background-color 0.3s;
                margin-bottom: 7px;
               
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
                cursor: pointer;
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


            .feature-overlay {
                position: relative;
                overflow: hidden; /* Hide overflow */
                border-radius: 8px; /* Rounded corners */
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* Shadow for depth */
                margin-bottom: 20px; /* Space between features */
            }

            .feature-overlay img {
                width: 100%;
                height:auto;
                object-fit: fill;
               
            }
            .feature-card img{
                object-fit: fill;
                width: 100%;
                height: 100%;
                margin-top:15px;
               
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
                height: max;
                border-radius: 10px;
                margin-top: 50px;
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


            .learn{
                 border-bottom-left-radius: 10px;
                border-bottom-right-radius: 10px;
                border-top-left-radius: 10px;
                border-top-right-radius: 10px;
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
                <p>Mutual Funds</p>
            </div>
        </div>

        <!-- Add a Bootstrap container around mutual-funds-section -->
        <div class="container">
            <div class="mutual-funds-section">
                <div class="row">
                    <div class="info">
                        <img src="photos/op.jpg" alt="Equity Funds">
                        <p>Invest in high-growth stocks through Equity Funds. Suitable for long-term investors looking for substantial returns with a higher risk tolerance.</p>
                        <div class="learn">
                        <button onclick="openModal('equityFund')">Learn More</button>
                        </div>
                    </div>

                    <div class="info">
                        <img src="photos/op1.jpg" alt="Debt Funds">
                        <p>Debt Funds are ideal for those seeking stable returns with lower risk. Invest in bonds and fixed-income securities for steady income generation.</p>
                        <div class="learn">
                        <button onclick="openModal('debtFund')">Learn More</button>
                        </div>
                    </div>

                    

                    <div class="info">
                        <img src="photos/op2.jpg" alt="Index Funds">
                        <p>Index Funds are designed to track the performance of a particular market index, providing diversified and low-cost investment options,United Bank offers.</p>
                        <div class="learn">
                        <button onclick="openModal('indexFund')">Learn More</button>
                        </div>
                    </div>


                </div>
            </div>
        </div>

        <section class="about-us py-5 ">
            <div class="container">
                <div class="row align-items-center">
                    <!-- About Us Text -->
                    <div class="col-md-6">
                        <h2 class="mb-4">About Our Mutual Funds</h2>
                        <p>
                            At United Bank, our Mutual Funds are designed to provide you with diverse investment opportunities. Whether you're looking for high-growth equity funds, stable returns from debt funds, or a balanced approach, we have the perfect mutual fund to match your financial goals.
                        </p>
                        <p>
                            Our mission is to empower you to make smarter investment decisions with secure and innovative banking solutions. With a range of options to choose from, you can diversify your portfolio and grow your wealth over time with our expertly managed mutual funds.
                        </p>
                    </div>
                    <!-- About Us Image -->
                    <div class="col-md-6">
                        <img src="photos/op3.jpg" alt="About Mutual Funds Image" class="img-fluid rounded shadow" height="1000" width="1000">
                    </div>
                </div>

                <!-- Core Values Section -->
                <div class="row mt-5 mb-5"> <!-- Added mb-5 for margin-bottom -->
                    <h3 class="text-center mb-4">Our Mutual Fund Features</h3>

                    <div class="col-md-4 text-center trust-section">
                        <img src="photos/security.jpg" alt="Trust Icon" class="mb-3 rounded-circle">
                        <h5>Security</h5>
                        <p>
                            Your investments are protected with top-notch security measures, ensuring that your funds remain safe and secure at all times.
                        </p>
                    </div>
                    <div class="col-md-4 text-center innovation-section">
                        <img src="photos/interest.jpg" alt="Interest Icon" class="mb-3 rounded-circle" height="250" width="250">
                        <h5>High Returns</h5>
                        <p>
                            Our Mutual Funds offer competitive returns, with a wide range of options for growth and income to meet your investment goals.
                        </p>
                    </div>
                    <div class="col-md-4 text-center customer-focus">
                        <img src="photos/access.jpg" alt="Accessibility Icon" class="mb-3 rounded-circle" height="200" width="200">
                        <h5>Easy Access</h5>
                        <p>
                            Manage your mutual fund investments conveniently through our online banking and mobile app. Track your portfolio anytime, anywhere.
                        </p>
                    </div>
                </div>


                <!-- Additional Text-based Information -->
                <div class="info-text">
                    <div class="info-text-card reveal">
                        <h4 class="reveal-text">Why Choose Our Mutual Funds?</h4>
                        <p class="reveal-text">
                            At United Bank, we offer diverse mutual fund options tailored to your risk tolerance and financial goals. Whether you're looking for growth, stability, or a balanced approach, our funds provide the perfect solution.
                        </p>
                    </div>

                    <div class="info-text-card reveal">
                        <h4 class="reveal-text">Our Commitment to Innovation</h4>
                        <p class="reveal-text">
                            We are constantly innovating to offer you cutting-edge investment solutions with transparent and easy-to-understand information on mutual funds.
                        </p>
                    </div>

                    <div class="info-text-card reveal">
                        <h4 class="reveal-text">Customer-Centric Services</h4>
                        <p class="reveal-text">
                            We are dedicated to helping you achieve your investment objectives. Our experts are available to provide you with personalized advice and guidance for your mutual fund investments.
                        </p>
                    </div>
                </div>

                <!-- Enhanced Additional Features Section -->
                <div class="row mt-5">
                    <div class="col-md-12 text-center">
                        <h3 class="mb-4">Key Benefits of Our Mutual Funds</h3>
                    </div>

                    <div class="col-md-4 text-center">
                        <div class="feature-card">
                            <div class="feature-overlay">
                                <img src="photos/op8.jpg" alt="No Management Fees" class="img-fluid rounded mb-3 feature-image" ">
                                <div class="overlay">
                                    <h5>No Management Fees</h5>
                                    <p>Enjoy low fees on our mutual funds, helping you maximize your returns while keeping costs low.</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4 text-center">
                        <div class="feature-card">
                            <div class="feature-overlay">
                                <img src="photos/op5.jpg" alt="Diversified Portfolio" class="img-fluid rounded mb-3 feature-image">
                                <div class="overlay">
                                    <h5>Diversified Portfolio</h5>
                                    <p>Our mutual funds offer diversification across various asset classes, reducing risk and improving potential returns.</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4 text-center">
                        <div class="feature-card">
                            <div class="feature-overlay">
                                <img src="photos/op9.jpg" alt="Expert Support" class="img-fluid rounded mb-3 feature-image">
                                <div class="overlay">
                                    <h5>Expert Support</h5>
                                    <p>Our team of investment experts is available to help guide you in selecting the right mutual fund for your goals.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="container d-flex align-items-mutual-fund-section">
                <!-- Wrapper around content and image for border -->
                <div class="instructions-wrapper">
                    <div class="instructions-content" style="margin-top:20px">
                        <h1 text-align="left">How to Invest in Our Mutual Funds</h1>
                        <ol>
                            <li>Visit your nearest United Bank branch or apply online.</li>
                            <li>Consult with our expert advisors to choose the right mutual fund for your goals.</li>
                            <li>Complete the application form with your personal and financial details.</li>
                            <li>Make your initial investment, starting from as low as $100.</li>
                            <li>Monitor your investments through our online banking platform or mobile app.</li>
                        </ol>
                    </div>
                    <div class="instructions-image">
                        <img src="photos/op78.jpg" alt="Investing in Mutual Funds Image" />
                    </div>
                </div>
            </div>

            <div class="create-account-container ">
                <a href="Create_Mutualfunds.jsp" class="create-account-btn"style="margin-top:30px">Invest in Mutual Funds</a>
            </div>

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
                case 'equityFund':
                    title.innerText = "Equity Fund Details";
                    content.innerText = "Our Equity Funds offer high-growth potential by investing in stocks of leading companies. Take advantage of capital appreciation over time with a diversified portfolio.";
                    break;
                case 'debtFund':
                    title.innerText = "Debt Fund Details";
                    content.innerText = "Debt Funds offer low-risk investment options focused on fixed income securities like bonds. These funds are ideal for conservative investors seeking stable returns.";
                    break;
                
                case 'indexFund':
                    title.innerText = "Index Fund Details";
                    content.innerText = "Index Funds aim to replicate the performance of a specific market index, offering low-cost, passive investment options with broad market exposure for long-term growth.";
                    break;
            }



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
