<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Car Loan Information - United Bank</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Navbar */
        .navbar {
            background-color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 1em 2em;
            top: 0;
            left: 0;
            width: 100%;
            z-index: 10;
            margin-bottom: 20px;
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
            transition: 0.3sec;
        }

        .navbar .logo-container {
            display: flex; 
            align-items: center;
        }

        /* Hero Section */
        .hero-section {
            background-color: #f8f9fa;
            padding: 80px 0;
            text-align: center;
        }

        .hero-section h1 {
            font-size: 3rem;
            color: #343a40;
        }

        .hero-section p {
            font-size: 1.25rem;
            color: #6c757d;
        }

        .hero-section img {
            width: 50%;
            max-height: 200px;
            object-fit: cover;
            border-radius: 20px;
            margin-top: 20px;
        }

        /* Info Boxes */
        .info-box {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
            transition: transform 0.3s ease;
        }

        .info-box img {
            width: 100%;
            max-height: 300px;
            object-fit: cover;
        }

        .info-box:hover {
            transform: translateY(-10px);
        }

        .section-title {
            font-size: 2rem;
            margin-bottom: 20px;
            color: #343a40;
        }

        /* Benefits Section */
        .benefit-item {
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
            background-color: #ffffff;
        }

        .benefit-item img {
            width: 100%;
            max-height: 200px;
            object-fit: fill;
        }

        /* FAQ Section */
        .faq-item {
            background-color: #ffffff;
            padding: 20px;
            margin-bottom: 15px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        /* Footer */
        .footer {
            background-color: #343a40;
            color: white;
            padding: 30px 0;
        }

        .testimonial {
            font-style: italic;
            color: #555;
        }

        .testimonial-author {
            font-weight: bold;
            color: #343a40;
            text-align: right;
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

<!-- Hero Section -->
<section class="hero-section">
    <div class="container">
        <h1>Drive Your Dream Car</h1>
        <p>Affordable rates, flexible terms, and fast approvals. Apply for your car loan now!</p>
        <p>At United Bank, we make owning a car easy. Our tailored car loan plans come with great rates and quick approvals.</p>
        <p>Whether it's your first car or a new upgrade, we are here to help you drive away with a deal that suits your budget.</p>
        <a href="create_car_loan.jsp" class="btn btn-dark btn-lg" style="margin-top: 20px">Apply Now</a>
    </div>
</section>

<!-- Eligibility Section for Car Loan -->
<section id="eligibility" class="container py-5">
    <u><h2 class="section-title text-center">Car Loan Eligibility Criteria</h2></u>
    <div class="row text-center">
        <div class="col-md-4">
            <div class="info-box">
                <h5>Age</h5>
                <p>Must be between 21 and 65 years of age</p>
                <img src="photos/ik.jpg" class="img-fluid" alt="Age Criteria for Car Loan">
            </div>
        </div>
        <div class="col-md-4">
            <div class="info-box">
                <h5>Income</h5>
                <p>Stable income from recognized employment or business</p>
                <img src="photos/ik1.jpg" class="img-fluid" alt="Income Criteria for Car Loan">
            </div>
        </div>
        <div class="col-md-4">
            <div class="info-box">
                <h5>Credit Score</h5>
                <p>Minimum credit score of 650 or higher</p>
                <img src="photos/pi.jpg" class="img-fluid" alt="Credit Score Criteria for Car Loan">
            </div>
        </div>
    </div>
</section>

<!-- Car Loan Benefits Section -->
<section id="loan-benefits" class="container py-5">
    <u><h2 class="section-title text-center">Car Loan Benefits</h2></u>
    <div class="row">
        <div class="col-md-4">
            <div class="benefit-item">
                <h5>Low-Interest Rates</h5>
                <p>Benefit from some of the most competitive interest rates in the market.</p>
                <img src="photos/ik3.jpg" class="img-fluid" alt="Low Interest Rates for Car Loan">
            </div>
        </div>
        <div class="col-md-4">
            <div class="benefit-item">
                <h5>Quick and Easy Approval</h5>
                <p>Fast approval process, so you can get on the road without delay.</p>
                <img src="photos/ik4.jpg" class="img-fluid" alt="Quick Car Loan Approval">
            </div>
        </div>
        <div class="col-md-4">
            <div class="benefit-item">
                <h5>Flexible Loan Terms</h5>
                <p>Choose a repayment plan that fits your financial situation.</p>
                <img src="photos/ik5.jpg" class="img-fluid" alt="Flexible Car Loan Repayment">
            </div>
        </div>
    </div>
</section>


<!-- Customer Testimonials Section -->
<section class="container py-5 bg-light">
    <u><h2 class="section-title text-center">What Our Customers Say</h2></u>
    <div class="row">
        <div class="col-md-4">
            <div class="testimonial">
                <p>"Thanks to United Bank, I was able to buy my dream car at an affordable rate. The process was simple, and I got my loan approved quickly!"</p>
                <div class="testimonial-author">John Doe</div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="testimonial">
                <p>"The flexible repayment terms were a game-changer for me. I was able to get a great deal without stress."</p>
                <div class="testimonial-author">Sarah Smith</div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="testimonial">
                <p>"The loan process was so quick and hassle-free! I am now driving my dream car, thanks to United Bank!"</p>
                <div class="testimonial-author">Raj Patel</div>
            </div>
        </div>
    </div>
</section>

<!-- FAQ Section -->
<section id="faq" class="container py-5">
    <u><h2 class="section-title text-center">Frequently Asked Questions</h2></u>
    <div class="row">
        <div class="col-md-12">
            <div class="faq-item">
                <h5>What documents are required to apply for a car loan?</h5>
                <p>We require proof of income, identity proof, address proof, and bank statements.</p>
            </div>
            <div class="faq-item">
                <h5>Can I apply for a loan if I have bad credit?</h5>
                <p>We offer loans to individuals with varying credit scores. Contact us for more details on your eligibility.</p>
            </div>
            <div class="faq-item">
                <h5>What is the maximum loan amount I can get?</h5>
                <p>The loan amount depends on your income and creditworthiness. Speak with one of our representatives to get an estimate.</p>
            </div>
        </div>
    </div>
</section>

<!-- Contact Section -->
<section class="contact-section">
    
    <p>If you have any questions or need assistance, feel free to reach out!</p>
    <u><a href="contact_us.jsp">Contact Us</a></u>
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
                    <li><a href="home_page.jsp">Home</a></li>
                   
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
