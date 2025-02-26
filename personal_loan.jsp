<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Personal Loan Information - United Bank</title>

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
            z-index: 10; /* Ensure navbar stays on top */
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
            width: 50%; /* Adjusted size */
            max-height: 200px; /* Adjusted size */
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
            width: 100%; /* Adjusted size */
            max-height: 300px; /* Adjusted size */
            object-fit: cover; /* Maintain aspect ratio */
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
            width: 100%; /* Adjusted size */
            max-height: 200px; /* Adjusted size */
            object-fit: fill; /* Maintain aspect ratio */
            
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

        /* Modals */
        .modal-header {
            font-size: 1.5em;
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
        <h1>Get the Best Personal Loan</h1>
        <p>Flexible terms, low-interest rates, and quick processing. Apply now for a seamless loan experience!</p>
        <p>At United Bank, we prioritize your financial well-being. With personalized service, a dedicated team, and a commitment to community growth, we aim to help you achieve your financial goals.</p>
        <p>Whether you're looking for a personal loan for home improvement, education, or any other purpose, our easy application process and rapid approval ensure you get the support you need.</p>
        <a href="create_personal_loan.jsp" class="btn btn-dark btn-lg" style="margin-top: 20px">Apply Now</a>
    </div>
</section>

   
</section>

<!-- Eligibility Section -->
<section id="eligibility" class="container py-5">
    <u><h2 class="section-title text-center">Personal Loan Eligibility Criteria</h2></u>
    <div class="row text-center">
        <div class="col-md-4">
            <div class="info-box">
                <h5>Age</h5>
                <p>Between 21-60 years of age</p>
                <img src="photos/mil_1.jpg" class="img-fluid" alt="Age Criteria">
            </div>
        </div>
        <div class="col-md-4">
            <div class="info-box">
                <h5>Income</h5>
                <p>Stable income from a recognized source</p>
                <img src="photos/mil2.jpg" class="img-fluid" alt="Income Criteria">
            </div>
        </div>
        <div class="col-md-4">
            <div class="info-box">
                <h5>Credit Score</h5>
                <p>Minimum credit score of 650</p>
                <img src="photos/pi.jpg" class="img-fluid" alt="Credit Score Criteria">
            </div>
        </div>
    </div>
</section>

<!-- Loan Benefits Section -->
<section id="loan-benefits" class="container py-5">
    <u><h2 class="section-title text-center"> Personal Loan Benefits</h2></u>
    <div class="row">
        <div class="col-md-4">
            <div class="benefit-item">
                <h5>Low Interest Rates</h5>
                <p>Get access to some of the lowest interest rates in the market.</p>
                <img src="photos/ol.jpg" class="img-fluid" alt="Low Interest Rates">
            </div>
        </div>
        <div class="col-md-4">
            <div class="benefit-item">
                <h5>Quick Processing</h5>
                <p>Fast and easy approval, with funds disbursed in as little as 24-48 hours.</p>
                <img src="photos/ol1.jpg" class="img-fluid" alt="Quick Processing">
            </div>
        </div>
        <div class="col-md-4">
            <div class="benefit-item">
                <h5>Flexible Repayment</h5>
                <p>Choose flexible repayment terms based on your financial situation.</p>
                <img src="photos/ol2.jpg" class="img-fluid" alt="Flexible Repayment">
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
                <p>"The loan process was smooth, and the approval was fast. I highly recommend United Bank!"</p>
                <div class="testimonial-author">- Sarah P.</div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="testimonial">
                <p>"I was impressed with the excellent customer service and quick processing time."</p>
                <div class="testimonial-author">- John D.</div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="testimonial">
                <p>"United Bank offered me the best interest rates and flexible repayment options."</p>
                <div class="testimonial-author">- Emma R.</div>
            </div>
        </div>
    </div>
</section>

<!-- FAQ Section -->
<section id="faq" class="container py-5">
    <u><h2 class="section-title text-center">Frequently Asked Questions</h2></u>
    <div class="faq-item">
        <h5>What is the maximum loan amount I can apply for?</h5>
        <p>The maximum loan amount varies based on your income and credit score.</p>
    </div>
    <div class="faq-item">
        <h5>How long does it take to get approved?</h5>
        <p>Approval can take as little as 24 hours, depending on the completeness of your application.</p>
    </div>
    <div class="faq-item">
        <h5>Can I prepay my loan?</h5>
        <p>Yes, you can prepay your loan without any penalties.</p>
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
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
</body>
</html>
