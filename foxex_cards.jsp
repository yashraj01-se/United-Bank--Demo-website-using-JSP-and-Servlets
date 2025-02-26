<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>United Bank Forex Cards</title>
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
                width: 104%; /* Full width */
                bottom: 0; /* Stick to the bottom */
                left: 0; /* Align to the left */
                z-index: 1000; /* Ensure it stays above other elements */
                margin-top: 20px; /* Space above footer */
                /* Use flexbox for layout */
                flex-direction: column; /* Stack items vertically */
                margin-bottom: -50px;
                margin-left: -50px;



            }

            .footer-container {
                display: flex;
                justify-content: space-around; /* Space between sections */
                align-items: flex-start; /* Align items at the start */
                flex-wrap: wrap; /* Allow wrapping of sections */
                max-width: 1400px; /* Max width of the container */
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
    <u><h2>Why Choose United Bank's Forex Cards?</h2></u>
    <p>United Bank offers a range of Forex Cards designed to make your international travel convenient and hassle-free. Our Forex Cards are accepted worldwide, ensuring you can make payments securely and avoid the risks associated with carrying cash.</p>
    <p>Enjoy benefits like low conversion rates, no hidden fees, and the ability to load multiple currencies on a single card. Whether you're traveling for business or leisure, our Forex Cards are your perfect companion!</p>
    <p>Apply for a Forex Card today and experience the convenience of hassle-free foreign exchange!</p>
</div>

<!-- Card Section -->
<div class="card-section">
    <!-- Global Travel Forex Card -->
    <div class="card">
        <img src="photos/g1.jpg" alt="Global Travel Forex Card">
        <h2>Global Travel Forex Card</h2>
        <p>Multi-currency card for travelers, with competitive exchange rates and low fees.</p>
        <div class="features">
            <h3>Features & Benefits:</h3>
            <ul>
                <li>Load multiple currencies on a single card.</li>
                <li>Competitive exchange rates and low fees.</li>
                <li>Accepted at millions of locations worldwide.</li>
                <li>Free online transaction alerts.</li>
            </ul>
        </div>
        <div class="card-details">
            <button onclick="window.location.href='create_forex_card.jsp'">Apply Now</button>
        </div>
    </div>

    <!-- Premium Travel Forex Card -->
    <div class="card">
        <img src="photos/g2.jpg" alt="Premium Travel Forex Card">
        <h2>Premium Travel Forex Card</h2>
        <p>Perfect for frequent travelers who need more currency options and premium features.</p>
        <div class="features">
            <h3>Features & Benefits:</h3>
            <ul>
                <li>Load multiple foreign currencies at competitive rates.</li>
                <li>Exclusive access to concierge services.</li>
                <li>Emergency card replacement and emergency cash service.</li>
                <li>Accepted globally with the ability to withdraw cash from ATMs.</li>
            </ul>
        </div>
        <div class="card-details">
            <button onclick="window.location.href='create_forex_card.jsp'">Apply Now</button>
        </div>
    </div>

    <!-- Student Forex Card -->
    <div class="card">
        <img src="photos/g3.jpg" alt="Student Forex Card">
        <h2>Student Forex Card</h2>
        <p>A Forex card designed for students studying abroad with special discounts and offers.</p>
        <div class="features">
            <h3>Features & Benefits:</h3>
            <ul>
                <li>Exclusive discounts on educational and lifestyle purchases.</li>
                <li>Easy online reloads.</li>
                <li>No hidden charges for foreign transactions.</li>
                <li>Multiple currency options for studying in different countries.</li>
            </ul>
        </div>
        <div class="card-details">
            <button onclick="window.location.href='create_forex_card.jsp'">Apply Now</button>
        </div>
    </div>

   
</div>

<!-- Customer Testimonials Section -->
<div class="testimonial-section">
    <h2>What Our Customers Are Saying</h2>
    <div class="testimonials">
        <div class="testimonial">
            <p>"I used the Global Travel Forex Card during my Europe trip. It was so convenient to load multiple currencies, and the exchange rates were much better than what I expected!"</p>
            <div class="name">- Sarah M.</div>
        </div>
        <div class="testimonial">
            <p>"The Premium Travel Forex Card was a lifesaver! I had access to emergency cash and the concierge service helped me with booking tours."</p>
            <div class="name">- John D.</div>
        </div>
        <div class="testimonial">
            <p>"As a student studying in the UK, the Student Forex Card helped me manage my expenses easily and I didn?t worry about exchange rate fluctuations."</p>
            <div class="name">- Priya S.</div>
        </div>
    </div>
</div>

<!-- FAQ Section -->
<div class="faq-section">
    <h2>Frequently Asked Questions</h2>
    <div class="faq">
        <div class="faq-item">
            <h3>How do I apply for a Forex card?</h3>
            <p>You can apply for a Forex card online through our website or visit your nearest United Bank branch.</p>
        </div>
        <div class="faq-item">
            <h3>What currencies can I load on the Forex card?</h3>
            <p>Our Forex cards allow you to load a wide range of currencies. You can load multiple currencies depending on your travel destinations.</p>
        </div>
        <div class="faq-item">
            <h3>Are there any hidden charges on Forex card transactions?</h3>
            <p>No, we ensure transparency with no hidden charges on foreign transactions. The exchange rates are competitive and clearly mentioned.</p>
        </div>
    </div>
</div>

<!-- Apply Now Section -->
<div class="apply-section">
    <h2>Ready to get your Forex Card?</h2>
    <p>Click below to get started with your Forex Card application.</p>
    <button onclick="window.location.href='create_forex_card.jsp'">Apply Now</button>
</div>

<!-- Contact Section -->
<div class="contact-section">
    <h2>Have Questions?</h2>
    <p>Feel free to reach out to us for more information or assistance with your Forex Card application.</p>
    <u> <a href="contact_us.jsp">Contact Us</a></u
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
