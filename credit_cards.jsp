<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>United Bank Credit Cards</title>
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
        
        
            .footer {
                background-color: #2c2c2c; /* Dark background color */
                color: white; /* Text color */
                padding: 40px 20px; /* Padding top and bottom */
                position: relative; /* Positioning for potential overlapping elements */
                width: 97%; /* Full width */
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
    <u><h2>Why Choose United Bank's Credit Cards?</h2></u>
    <p>United Bank offers a range of credit cards that cater to every lifestyle. Whether you're a frequent traveler, someone who loves dining out, or simply looking for everyday rewards, our credit cards provide benefits and features that suit your needs.</p>
    <p>Enjoy exclusive access to luxury lounges, special discounts on movies, fuel surcharge waivers, and much more. Plus, earn reward points on every purchase and redeem them for exciting rewards!</p>
    <p>Our cards are designed to ensure you get the most value with zero joining fee and minimal annual fees. Apply today and start enjoying these benefits!</p>
</div>

<!-- Card Section -->
<div class="card-section">
    <!-- Platinum Chip Credit Card -->
    <div class="card">
        <img src="photos/l1.jpg" alt="Platinum Chip Credit Card">
        <h2>Platinum Chip Credit Card</h2>
        <p>No Joining Fee. No Annual Fee. Earn Reward Points on all spends except fuel.</p>
        <div class="features">
            <h3>Features & Benefits:</h3>
            <ul>
                <li>No joining fee or annual fee.</li>
                <li>Earn Reward Points on every spend (except fuel).</li>
                <li>Save on fuel surcharge (waived off at HPCL petrol pumps).</li>
                <li>Access to exclusive offers and discounts.</li>
            </ul>
        </div>
        <div class="card-details">
            <button onclick="window.location.href='create_credit_card.jsp'">Apply Now</button>
        </div>
    </div>

    <!-- Times Black Credit Card -->
    <div class="card">
        <img src="photos/l2.jpg" alt="Times Black Credit Card">
        <h2>Times Black Premium Credit Card</h2>
        <p>Enjoy luxury stay gift card and complimentary lounge access.</p>
        <div class="features">
            <h3>Features & Benefits:</h3>
            <ul>
                <li>Luxury stay gift card worth ?10,000 from EaseMyTrip.</li>
                <li>Complimentary access to international and domestic airport lounges.</li>
                <li>Exclusive travel benefits with Atlys and OneVasco worth ?10,000.</li>
                <li>Special access to The Quorum club with exceptional benefits.</li>
            </ul>
        </div>
        <div class="card-details">
            <button onclick="window.location.href='create_credit_card.jsp'">Apply Now</button>
        </div>
    </div>

    <!-- Emeralde Private Metal Credit Card -->
    <div class="card">
        <img src="photos/l3.jpg" alt="Emeralde Private Metal Credit Card">
        <h2>Emeralde Private Metal Credit Card</h2>
        <p>Complimentary night stays and premium membership perks.</p>
        <div class="features">
            <h3>Features & Benefits:</h3>
            <ul>
                <li>Complimentary 1-night stay with Epicure Plus Membership.</li>
                <li>Exclusive EazyDiner Prime Membership every year.</li>
                <li>Joining bonus of 12,500 ICICI Bank Reward Points.</li>
                <li>EaseMyTrip air travel vouchers worth ?6,000 on select spends.</li>
            </ul>
        </div>
        <div class="card-details">
            <button onclick="window.location.href='create_credit_card.jsp'">Apply Now</button>
        </div>
    </div>

    <!-- Sapphiro Credit Card -->
    <div class="card">
        <img src="photos/l4.jpg" alt="Sapphiro Credit Card">
        <h2>Sapphiro Credit Card</h2>
        <p>Welcome vouchers and complimentary airport lounge access.</p>
        <div class="features">
            <h3>Features & Benefits:</h3>
            <ul>
                <li>Welcome vouchers worth ?9,000+.</li>
                <li>Complimentary access to international airport lounges (2 per year).</li>
                <li>Discounts on movie tickets (BookMyShow, twice per month).</li>
                <li>Exclusive offers on luxury brands and retail shopping.</li>
            </ul>
        </div>
        <div class="card-details">
            <button onclick="window.location.href='create_credit_card.jsp'">Apply Now</button>
        </div>
    </div>

    <!-- Rubyx Credit Card -->
    <div class="card">
        <img src="photos/l5.jpg" alt="Rubyx Credit Card">
        <h2>Rubyx Credit Card</h2>
        <p>Discounts on movie tickets and insurance coverage.</p>
        <div class="features">
            <h3>Features & Benefits:</h3>
            <ul>
                <li>Welcome vouchers worth ?5,000+.</li>
                <li>25% discount on movie tickets (BookMyShow & Inox).</li>
                <li>Air accident insurance of ?1 crore.</li>
                <li>Complimentary rounds of golf (up to 2 per month).</li>
            </ul>
        </div>
        <div class="card-details">
            <button onclick="window.location.href='create_credit_card.jsp'">Apply Now</button>
        </div>
    </div>

    <!-- Coral Credit Card -->
    <div class="card">
        <img src="photos/l6.jpg" alt="Coral Credit Card">
        <h2>Coral Credit Card</h2>
        <p>Discounts on movie tickets and airport lounge access.</p>
        <div class="features">
            <h3>Features & Benefits:</h3>
            <ul>
                <li>25% discount on movie tickets (BookMyShow & Inox).</li>
                <li>Complimentary domestic railway and airport lounge access (1 per quarter).</li>
                <li>Fuel surcharge waiver (1% at HPCL petrol pumps).</li>
            </ul>
        </div>
        <div class="card-details">
            <button onclick="window.location.href='create_credit_card.jsp'">Apply Now</button>
        </div>
    </div>
</div>
<!-- Customer Testimonials Section -->
<div class="testimonial-section">
    <h2>What Our Customers Are Saying</h2>
    <div class="testimonials">
        <div class="testimonial">
            <p>"I've been using the Platinum Chip Credit Card for over a year, and the benefits are amazing! I love the no annual fee and the reward points I earn on every purchase."</p>
            <div class="name">-Jasmine Sharma</div>
        </div>
        <div class="testimonial">
            <p>"The Times Black Premium Credit Card gave me access to international airport lounges, and the luxury stay gift card was such a thoughtful addition!"</p>
            <div class="name">-Akhil Verma </div>
        </div>
        <div class="testimonial">
            <p>"I love the variety of cards offered by United Bank. The rewards are so generous, and the customer service is top-notch!"</p>
            <div class="name">-Amit Yadav</div>
        </div>
    </div>
</div>

<!-- FAQ Section -->
<div class="faq-section">
    <u><h2>Frequently Asked Questions</h2></u>
    <div class="faq">
        <div class="faq-item">
            <h3>How can I apply for a credit card?</h3>
            <p>You can apply online by clicking on the 'Apply Now' button on any credit card details page, or visit your nearest branch for assistance.</p>
        </div>
        <div class="faq-item">
            <h3>Are there any annual fees?</h3>
            <p>Many of our credit cards come with no annual fee or minimal charges. Please check the terms of each card for detailed information.</p>
        </div>
        <div class="faq-item">
            <h3>How do I earn reward points?</h3>
            <p>You earn reward points with every purchase made using the credit card, except for fuel purchases. The points can be redeemed for various rewards!</p>
        </div>
    </div>
</div>

<!-- Apply Now Section -->
<div class="apply-section">
    <h2>Ready to Get Your Credit Card?</h2>
    <p>Don't miss out on the incredible benefits and rewards. Apply for your United Bank credit card today!</p>
<button onclick="window.location.href='create_credit_card.jsp'">Apply Now</button>
</div>

<!-- Card Section -->
<div class="card-section">
    <!-- Card Details (Same as before) -->
    <!-- Include the individual cards here, like in the previous section -->
</div>

<!-- Contact Section -->
<div class="contact-section">
    <h2>Need Assistance?</h2>
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
