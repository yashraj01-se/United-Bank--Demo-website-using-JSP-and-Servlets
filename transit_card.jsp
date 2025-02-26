<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>United Bank Transit Cards</title>
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

        /* Section with General Information */
        .info-section {
            background-color: #f9f9f9;
            padding: 4em 2em;
            margin-top: 60px;
            text-align: center;
        }

        .info-section h2 {
            font-size: 2em;
            margin-bottom: 1em;
        }

        .info-section p {
            font-size: 1.2em;
            color: #555;
            line-height: 1.5;
            margin-bottom: 2em;
        }

        /* Card Section */
        .card-section {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 30px;
            padding: 3em 2em;
            margin-top: 60px;
        }

        .card {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            text-align: center;
            transition: transform 0.3s, box-shadow 0.3s;
            cursor: pointer;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            margin: 0 auto;
            padding: 1.5em;
        }

        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
        }

        .card img {
            width: 100%;
            height: 150px;
            object-fit: cover;
            border-radius: 5px;
        }

        .card h2 {
            color: #333;
            padding: 0.5em;
            font-size: 1.6em;
            margin-bottom: 1em;
        }

        .card p {
            padding: 0 1em;
            color: #555;
            margin-bottom: 1.5em;
        }

        .card .features {
            text-align: left;
            padding: 0 1em;
            color: #444;
            font-size: 0.95em;
            margin-bottom: 1.5em;
        }

        .card .features ul {
            list-style-type: disc;
            margin-left: 20px;
        }

        .card button {
            background-color: black;
            color: white;
            border: none;
            padding: 10px;
            width: 100%;
            font-size: 1.2em;
            cursor: pointer;
            border-bottom-left-radius: 10px;
            border-bottom-right-radius: 10px;
            transition: background-color 0.3s;
        }

        .card button:hover {
            background-color: gray;
        }

        /* Customer Testimonials Section */
        .testimonial-section {
            background-color: #f1f1f1;
            padding: 3em 2em;
            text-align: center;
        }

        .testimonial-section h2 {
            font-size: 2em;
            margin-bottom: 1em;
        }

        .testimonial-section .testimonials {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
        }

        .testimonial {
            background-color: white;
            padding: 1.5em;
            border-radius: 10px;
            width: 30%;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin: 1em;
        }

        .testimonial p {
            font-style: italic;
            color: #666;
        }

        .testimonial .name {
            font-weight: bold;
            margin-top: 1em;
            color: #333;
        }

        /* FAQ Section */
        .faq-section {
            background-color: #e7e7e7;
            padding: 3em 2em;
            text-align: center;
        }

        .faq-section h2 {
            font-size: 2em;
            margin-bottom: 1em;
        }

        .faq-section .faq {
            display: flex;
            flex-direction: column;
            gap: 1.5em;
        }

        .faq-item {
            background-color: white;
            padding: 1.5em;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .faq-item h3 {
            color: #333;
            font-size: 1.4em;
        }

        .faq-item p {
            color: #555;
            margin-top: 0.5em;
        }

        /* Apply Now Section */
        .apply-section {
            background-color: black;
            color: white;
            padding: 4em 2em;
            text-align: center;
        }

        .apply-section h2 {
            font-size: 2.5em;
            margin-bottom: 1em;
        }

        .apply-section p {
            font-size: 1.2em;
            margin-bottom: 2em;
        }

        .apply-section button {
            background-color: white;
            color: black;
            padding: 1em 2em;
            font-size: 1.2em;
            border: none;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .apply-section button:hover {
            background-color: gray;
            cursor: pointer;
        }


        /* Contact Section */
        .contact-section {
            background-color: #f1f1f1;
            padding: 3em 2em;
            text-align: center;
            margin-top: 10px;
        }

        .contact-section h2 {
            font-size: 2em;
            margin-bottom: 1em;
        }

        .contact-section p {
            font-size: 1.2em;
            margin-bottom: 1.5em;
        }

        .contact-section a {
            font-size: 1.2em;
            color: black;
            text-decoration: none;
            font-weight: bold;
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




        /* Responsive Design - Media Queries */
        @media (max-width: 1024px) {
            .card-section {
                grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
                gap: 25px;
            }
        }

        @media (max-width: 768px) {
            .navbar {
                flex-direction: column;
                align-items: flex-start;
            }

            .card-section {
                grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
                gap: 20px;
            }

            .card {
                width: 100%;
            }
        }

        @media (max-width: 480px) {
            .card {
                width: 100%;
                margin: 10px 0;
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

<!-- General Information Section -->
<div class="info-section">
    <u><h2>Why Choose United Bank's Transit Cards?</h2></u>
    <p>United Bank offers a range of transit cards that make your travel hassle-free and convenient. Whether you're commuting in the city or traveling between regions, our transit cards offer seamless access to transport systems, discounts, and rewards on every journey.</p>
    <p>Enjoy easy reloading, instant top-up, and 24/7 customer support. Skip the line at ticket counters and get quick access to buses, metros, and other transit services. Our cards are designed to make your daily commute more comfortable and cost-effective.</p>
    <p>Apply today and enjoy the freedom of easy transit payments without any worries!</p>
</div>

<!-- Card Section -->
<div class="card-section">
    <!-- CityPass Transit Card -->
    <div class="card">
        <img src="photos/z1.jpg" alt="CityPass Transit Card">
        <h2>CityPass Transit Card</h2>
        <p>Convenient and easy access to all local transport services.</p>
        <div class="features">
            <h3>Features & Benefits:</h3>
            <ul>
                <li>Accepted on buses, metro, and trains.</li>
                <li>Instant top-up at convenience stores and online.</li>
                <li>Save on every trip with discounted fares.</li>
                <li>Track your travel expenses through our mobile app.</li>
            </ul>
        </div>
        <div class="card-details">
            <button onclick="window.location.href='create_transit_card.jsp'">Apply Now</button>
        </div>
    </div>

    <!-- MetroCard Transit Card -->
    <div class="card">
        <img src="photos/z2.jpg" alt="MetroCard Transit Card">
        <h2>MetroCard Transit Card</h2>
        <p>Skip the line and enjoy easy access to metro stations.</p>
        <div class="features">
            <h3>Features & Benefits:</h3>
            <ul>
                <li>Convenient for metro and bus travel.</li>
                <li>Recharge online or at metro stations.</li>
                <li>Free up to 3 rides per month for senior citizens.</li>
                <li>Track your balance and usage on our app.</li>
            </ul>
        </div>
        <div class="card-details">
            <button onclick="window.location.href='create_transit_card.jsp'">Apply Now</button>
        </div>
    </div>

    <!-- FlexiTravel Card -->
    <div class="card">
        <img src="photos/z3.jpg" alt="FlexiTravel Card">
        <h2>FlexiTravel Card</h2>
        <p>Perfect for commuters who use various modes of transport.</p>
        <div class="features">
            <h3>Features & Benefits:</h3>
            <ul>
                <li>Compatible with buses, metro, and taxis.</li>
                <li>Customizable fare options for frequent travelers.</li>
                <li>Free travel insurance with every trip.</li>
                <li>Earn points with every journey that can be redeemed for rewards.</li>
            </ul>
        </div>
        <div class="card-details">
            <button onclick="window.location.href='create_transit_card.jsp'">Apply Now</button>
        </div>
    </div>
</div>

<!-- Customer Testimonials Section -->
<div class="testimonial-section">
    <h2>What Our Customers Are Saying</h2>
    <div class="testimonials">
        <div class="testimonial">
            <p>"The CityPass card makes commuting so easy! I can just tap and go without worrying about tickets."</p>
            <div class="name">-Rachel Thomas</div>
        </div>
        <div class="testimonial">
            <p>"I use the MetroCard for my daily travel, and the convenience of recharging online is fantastic!"</p>
            <div class="name">-Samuel Lee</div>
        </div>
        <div class="testimonial">
            <p>"FlexiTravel has saved me time and money. It works on all forms of transport and I love earning rewards!"</p>
            <div class="name">-Kiran Patel</div>
        </div>
    </div>
</div>

<!-- FAQ Section -->
<div class="faq-section">
    <u><h2>Frequently Asked Questions</h2></u>
    <div class="faq">
        <div class="faq-item">
            <h3>How do I get a transit card?</h3>
            <p>You can apply online or visit any partner outlet to get your transit card.</p>
        </div>
        <div class="faq-item">
            <h3>Can I recharge my card online?</h3>
            <p>Yes, you can easily recharge your transit card using our online portal or mobile app.</p>
        </div>
        <div class="faq-item">
            <h3>Are there any discounts available?</h3>
            <p>Yes! We offer discounts on fares, as well as loyalty points on every journey that can be redeemed for rewards.</p>
        </div>
    </div>
</div>

<!-- Apply Now Section -->
<div class="apply-section">
    <h2>Ready to Get Your Transit Card?</h2>
    <p>Apply now and start enjoying the convenience of hassle-free travel.</p>
    <button onclick="window.location.href='create_transit_card.jsp'">Apply Now</button>
</div>

<!-- Contact Section -->
<div class="contact-section">
    <h2>Need Help?</h2>
    <p>If you have any questions or need help with the application process, feel free to reach out to us.</p>
        <u><a href="contact_us.jsp">Contact Us</a></u>
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
