<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - United Bank</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* General Page Styling */
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            margin: 0;
            padding: 0;
            background-color:white;
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
        .trust-section img:hover,
        .Innovation-section img:hover,
        .Customer-focus img:hover {
            transform: scale(1.1);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2); /* Adds a shadow on hover */
            transition: 0.3s ease;
        }

        /* Carousel Styles */
        .carousel-item img {
            width: 100%;
            height: 530px;
            object-fit: cover;
            margin-top: 20px;
        }

        /* Section for text information */
        .info-text {
            margin-top: 50px;
            text-align: center;
            background-color: #f8f9fa;
            padding: 60px 20px;
            position: relative;
            overflow: hidden;
        }

        .info-text h4 {
            font-size: 1.8rem;
            color: #333;
            margin-bottom: 20px;
            position: relative;
        }

        .info-text p {
            font-size: 1.125rem;
            color: #555;
            line-height: 1.7;
            max-width: 800px;
            margin: 0 auto;
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

        /* Responsive Design */
        @media (max-width: 768px) {
            .info-text-card {
                padding: 20px;
            }
            .info-text-card h4 {
                font-size: 1.5rem;
            }
            .info-text-card p {
                font-size: 1rem;
            }
            .carousel-item img {
                height: 250px;
            }
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
        /* Footer */
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

    <section class="about-us py-5">
        <div class="container">
            <div class="row align-items-center">
                <!-- About Us Text -->
                <div class="col-md-6">
                    <h2 class="mb-4"></h2>
                    <p>
                        At United Bank, we are committed to providing exceptional banking services 
                        that empower individuals, businesses, and communities to achieve their financial goals. 
                        With a legacy of trust and innovation, we offer a wide range of banking solutions 
                        tailored to your needs.
                    </p>
                    <p>
                        Our mission is to deliver secure, customer-centric, and forward-thinking 
                        financial services. We pride ourselves on building strong relationships and making a positive 
                        impact on the lives of our customers.
                    </p>
                </div>
                <!-- About Us Image -->
                <div class="col-md-6">
                    <img src="photos/te.jpg" alt="About Us Image" class="img-fluid rounded shadow" height="1000" width="1000">
                </div>
            </div>

            <!-- Core Values Section -->
            <div class="row mt-5 mb-5"> <!-- Added mb-5 for margin-bottom -->
                <h3 class="text-center mb-4">Our Core Values</h3>

                <div class="col-md-4 text-center trust-section">
                    <img src="photos/th (1).jpg" alt="Trust Icon" class="mb-3 rounded-circle">
                    <h5>Trust</h5>
                    <p>
                        We uphold the highest standards of integrity and transparency in all our dealings.
                    </p>
                </div>
                <div class="col-md-4 text-center Innovation-section">
                    <img src="photos/th(2).jpg" alt="Innovation Icon" class="mb-3 rounded-circle" height="250" width="250">
                    <h5>Innovation</h5>
                    <p>
                        Embracing technology to deliver modern and efficient banking experiences.
                    </p>
                </div>
                <div class="col-md-4 text-center Customer-focus">
                    <img src="photos/th(3).jpg" alt="Customer Focus Icon" class="mb-3 rounded-circle" height="200" width="200">
                    <h5>Customer Focus</h5>
                    <p>
                        Putting our customers at the heart of everything we do.
                    </p>
                </div>
            </div>

            <!-- Dynamic Scrolling Image Section (Carousel) -->
            <div class="carousel slide mt-5" id="carouselExampleAutoplaying" data-bs-ride="carousel">
                <div class="carousel-inner">
                    <!-- First Image -->
                    <div class="carousel-item active">
                        <img src="photos/t(1).jpg" class="d-block w-100" alt="First Image">
                    </div>
                    <!-- Second Image -->
                    <div class="carousel-item">
                        <img src="photos/t(2).jpg" class="d-block w-100" alt="Second Image">
                    </div>
                    <!-- Third Image -->
                    <div class="carousel-item">
                        <img src="photos/t(3).jpg" class="d-block w-100" alt="Third Image">
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
                    <h4 class="reveal-text">Why Choose United Bank?</h4>
                    <p class="reveal-text">
                        At United Bank, we believe in empowering our clients with the tools and resources they need to succeed in an ever-changing financial landscape. Our dedication to innovation and personalized service has earned us the trust of individuals, businesses, and communities alike.
                    </p>
                </div>

                <div class="info-text-card reveal">
                    <h4 class="reveal-text">Our Commitment to Innovation</h4>
                    <p class="reveal-text">
                        United Bank is at the forefront of digital banking innovation, utilizing the latest technology to ensure that our customers have access to seamless, efficient, and secure banking solutions. Whether it's through our mobile app, online banking platform, or other digital services, we are continuously working to provide you with the best banking experience.
                    </p>
                </div>

                <div class="info-text-card reveal">
                    <h4 class="reveal-text">Customer-Centric Services</h4>
                    <p class="reveal-text">
                        We prioritize our customers' needs above all else. Our team of experts is always available to provide personalized guidance, helping you make informed financial decisions. With our dedicated customer service, you can be confident that we are always working in your best interest.
                    </p>
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

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
