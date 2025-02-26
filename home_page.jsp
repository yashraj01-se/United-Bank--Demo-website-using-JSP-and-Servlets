<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- Add Bootstrap CSS link -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <title>United Bank</title>
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            html, body {
                margin: 0;
                padding: 0;
                width: 100%;
                height: 100%;
                overflow-x: hidden; /* Prevent horizontal overflow */
                font-family: Arial, sans-serif;
                background-color: whitesmoke;
            }


            .navbar {
                align-items: center;
                display: flex;
                justify-content: space-between;
                background-color: white;
                padding: 0.5em 1em;
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

            .nav-links {
                display: flex;
            }

            .user-circle {
                position: relative;
                display: flex;
                align-items: center;
                justify-content: center;
                width: 40px;
                height: 40px;
                border-radius: 50%;
                background-color: lightgray;
                color: black;
                cursor: pointer;
                margin-left: 1em;
            }

            .user-circle img {
                width: 90%;
                height: 95%;
                border-radius: 50%;
                object-fit: cover;
                display: block;
            }

            .dropdown {
                display: none;
                position: absolute;
                top: 50px;
                right: 0;
                background-color: white;
                border: 1px solid #ddd;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
                border-radius: 5px;
                padding: 10px;
                z-index: 100;
            }

            .dropdown p {
                margin: 0;
                padding: 5px 10px;
                font-size: 0.9em;
                cursor: default;
            }

            .dropdown p:hover {
                background-color: #f5f5f5;
            }

            .logout-options {
                display: none;
                margin-top: 5px;
                cursor: pointer;
            }

            .logout-options button {
                padding: 5px 10px;
                margin-right: 5px;
                border: none;
                border-radius: 3px;
                cursor: pointer;
            }

            .logout-options .confirm {
                background-color: #d9534f;
                color: white;
            }

            .logout-options .cancel {
                background-color: #5bc0de;
                color: white;
            }

            .subnavbar {
                display: flex;
                justify-content: flex-start;
                background-color: white;
                padding: 0.5em 1em;
                border-top: 1px solid #ddd;
            }

            .subnavbar a {
                color: black;
                text-decoration: none;
                padding: 0.5em 1em;
                margin-right: 1em;
                transition: background-color 0.3s ease;
            }

            .subnavbar a:hover {
                background-color: gainsboro;
                border-radius: 4px;
            }

            .heading-container {
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: 50px;
            }

            .custom-section {
                padding: 50px;
                text-align: center;
                background-color: #f8f9fa;
            }

            .custom-section h2 {
                 margin-bottom: 50px;
                font-size: 375%;
                transition: font-size 0.3s ease, color 0.3s ease;
            }
            .custom-section h1 {
                margin-bottom: 50px;
                font-size: 375%;
                transition: font-size 0.3s ease, color 0.3s ease;
                
            }
            .custom-section h1:hover{
                font-size: 5em;
                color: gray;
               
            }
            .custom-section h2:hover {
                  font-size: 5em;
                color: gray;
            }

            .custom-button {
                margin-top: 20px;
                padding: 10px 20px;
                background-color: black;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }

            .custom-button:hover {
                background-color: gray;
            }

            /* Center the entire row in the middle of the page */
            .row {
                display: flex;
                justify-content: center; /* Horizontally center the content */
                align-items: center; /* Vertically center the content */
                height: 100vh; /* Full viewport height */
                margin: 0; /* Remove default margin */
                flex-wrap: wrap; /* Allow cards to wrap in case of multiple cards */
            }

            /* Add custom styling for the .custom-card */
            .custom-card {
                border: 1px solid #ddd; /* Light border */
                border-radius: 8px; /* Rounded corners */
                padding: 25px; /* Increased padding for a larger card */
                background-color: #f9f9f9; /* Light background */
                text-align: center; /* Center the content */
                transition: transform 0.3s ease; /* Smooth transition for hover effects */
                margin: 20px; /* Space between cards */
                width: 320px; /* Increased width for the card */
                box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1); /* Larger shadow for more depth */
            }

            /* Styling for the image */
            .custom-card img {
                width: 100%; /* Make the image take up full width of the parent container */
                height: auto; /* Keep the aspect ratio of the image */
                border-radius: 8px; /* Rounded corners for the image */
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Subtle shadow for the image */
                margin-bottom: 20px; /* Space between the image and text */
            }

            /* Hover effect to scale the card */
            .custom-card:hover {
                transform: scale(1.05); /* Slightly enlarge the card */
            }

            /* Style the paragraph text */
            .custom-card p {
                font-size: 16px; /* Reduced font size for the text */
                color: #333; /* Dark text color */
                font-weight: 500; /* Slightly bold text */
                margin-top: 10px; /* Space between the image and the text */
            }
            .footer {
                background-color: #2c2c2c; /* Dark background color */
                color: white; /* Text color */
                padding: 40px 20px; /* Padding top and bottom */
                position: relative; /* Positioning for potential overlapping elements */
                width: 109%; /* Full width */
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



        </style>
    </head>
    <body>

        <div class="navbar">
            <div class="logo-container">
                <img src="photos/logo.jpg" style="height: 40px;" alt="Logo">
                <div class="logo">United Bank</div>
            </div>
            <div class="nav-links">
                <a href="About_us.jsp">About Us</a>
                <%
                    String usernamedata = (String) session.getAttribute("username");
                    if (usernamedata == null) { // Show Login button only if username is not set
                %>
                <a href="login.jsp">Login</a>
                <%
                    }
                %>
                <a href="contact_us.jsp">Contact Us</a>

                <!-- User Circle -->
                <%
                    String firstName = (String) session.getAttribute("firstName");
                    String username = (String) session.getAttribute("username");
                %>
                <div class="user-circle" 
                     <% if (username != null) { %>
                     onclick="toggleDropdown(event)"
                     <% } %>
                     >
                    <%
                        if (firstName != null && !firstName.isEmpty()) {
                    %>
                    <%= Character.toUpperCase(firstName.charAt(0))%>
                    <%
                    } else {
                    %>
                    <img src="photos/logo.jpg" alt="User Icon">
                    <%
                        }
                    %>
                    <div class="dropdown">
                        <p><strong>Username:</strong> <%= username != null ? username : "N/A"%></p>
                        <p><strong>Email:</strong> <%= session.getAttribute("email") != null ? session.getAttribute("email") : "N/A"%></p>
                        <% if (username != null) { %>
                        <p class="logout" onclick="toggleLogoutOptions(event)">Logout</p>
                        <div class="logout-options">
                            <button class="confirm" onclick="confirmLogout()">Are you Sure?</button>
                            <button class="cancel" onclick="cancelLogout()">No</button>
                        </div>
                        <% }%>
                    </div>
                </div>
            </div>
        </div>

        <div class="subnavbar">
            <a href="account_variety.jsp">Accounts</a>
            <a href="deposits.jsp">Deposits</a>
            <a href="payments.jsp">Payments</a>
            <a href="cards_variety.jsp">Cards</a>
            <a href="Loan_variety.jsp">Loan</a>
            <a href="Investments_variety.jsp">Investments</a>
            <a href="#Insurance">Insurance</a>
        </div>


        <!-- Home Page Section: Features -->
        <div class="custom-section">
            <h1 >2024 outlooks and forecasts </h1>
            <div class="row">
                <div class="col-md-3 custom-card">
                    <img src="photos/ko.jpg" alt="Feature Image">
                    <p>Our features are designed to help you manage your finances easily and securely. From checking accounts to loans, we provide a comprehensive suite of tools. With intuitive interfaces and robust security measures, you can track, manage, and grow your finances all in one convenient place.</p>
                </div>
                <div class="col-md-3 custom-card">
                    <img src="photos/ko1.jpg" alt="Feature Image">
                    <p>Enjoy 24/7 online banking with fast payments and access to the latest banking technologies. Manage your accounts anytime, make secure transactions, and stay up-to-date with innovative tools designed for convenience. Our platform ensures easy navigation and top-tier security.</p>
                </div>
                <div class="col-md-3 custom-card">
                    <img src="photos/ko2.jpg" alt="Feature Image">
                    <p>Our app enables quick and easy transactions, no matter where you are. With secure, real-time access to your accounts, you can bank anytime, anywhere. Whether paying bills, transferring funds, enjoy seamless financial management on the go with our user-friendly app.</p>
                </div>
            </div>
        </div>



        <div class="custom-section">
            <h2>Our Services</h2>
            <div class="row">
                <div class="col-md-4 custom-card">
                    <img src="photos/ko3.jpg" alt="Service Image">
                    <p>We offer a range of services, including savings accounts and personal loans, designed to help you achieve your financial goals. Our solutions are tailored to meet your unique needs and aspirations.</p>
                </div>
                <div class="col-md-4 custom-card">
                    <img src="photos/ko4.jpg" alt="Service Image">
                    <p>Explore our comprehensive range of investment opportunities, designed to help you secure your financial future. With tailored solutions, you can grow your wealth and ensure long-term financial stability.</p>
                </div>
                <div class="col-md-4 custom-card">
                    <img src="photos/ko5.jpg" alt="Service Image">
                    <p>Enjoy seamless access to mortgages and home loans, customized to help you secure your dream home. Our flexible options make homeownership easier, providing the financial support you need for your future.</p>
                </div>
            </div>



            <!-- Sections for each Navbar item -->
            <div class="custom-section">
                <u><h2>Accounts</h2></u>
                <p style="text-align: center">Accounts at United Bank

                    At United Bank, we offer a wide range of accounts designed to meet your personal and business financial needs. Whether you are just starting to save or managing your everyday finances, we have an account for you.

                    Our savings accounts provide a secure way to grow your money with competitive interest rates, helping you save for future goals. We also offer checking accounts that give you easy access to your funds with features like online banking, mobile app access, and no monthly fees for many account types. Perfect for managing your day-to-day expenses.

                    For those with more specific needs, we have student accounts designed to help young people start their financial journey, with no monthly fees and easy access to funds. Business accounts cater to entrepreneurs and companies, offering features like easy deposits, payroll processing, and dedicated customer service.

                    Additionally, our joint accounts are perfect for partners or families who want to manage shared expenses, while our premium accounts offer exclusive benefits such as higher interest rates, priority support, and additional financial tools.

                    At United Bank, we prioritize flexibility, security, and customer satisfaction. Whether you are saving for a big purchase or managing your daily transactions, our accounts are built to suit your unique financial needs.



                </p>
                <button class="custom-button" onclick="window.location.href = 'account_variety.jsp'">Learn More</button>
            </div>

            <div class="custom-section">
                <u><h2>Deposits</h2></u>
                <p style="text-align: center">United Bank offers a variety of deposit options designed to help you save and grow your money securely. Whether you are looking for short-term savings or long-term investment, our range of deposit products can meet your needs.

                    Our Fixed Deposits (FDs) provide a secure way to invest your money for a fixed tenure, offering attractive interest rates. With flexible terms ranging from a few months to several years, you can choose the option that best suits your financial goals. Fixed deposits offer the advantage of guaranteed returns, making them a popular choice for conservative investors seeking low-risk investments.

                    For those who prefer regular savings, our Recurring Deposits (RDs) are an excellent option. RDs allow you to save a fixed amount each month over a specified period. This option is perfect for individuals who want to build their savings gradually while earning interest on their contributions. It is a disciplined way to save for future needs like education, marriage, or travel.

                    Additionally, United Bank offers Tax-Saving Fixed Deposits, which provide tax benefits under Section 80C of the Income Tax Act, helping you save on taxes while earning interest on your deposits.

                    With competitive interest rates, security, and flexible terms, United Bank's deposit options are designed to help you achieve your financial goals with peace of mind.



                </p>
                <button class="custom-button" onclick="window.location.href = 'deposits.jsp'">Learn More</button>
            </div>

            <div class="custom-section">
                <u><h2>Payments</h2></u>
                <p style="text-align: center">At United Bank, we offer a secure and convenient online payment system that allows you to make transactions quickly and efficiently. Whether you are paying bills, transferring funds, or shopping online, our platform ensures that all your payments are processed securely with advanced encryption technology.

                    Our online payment system is user-friendly, designed to give you access to a wide range of payment options. You can make instant transfers to other bank accounts, pay credit card bills, utilities, and even recharges for mobile phones and DTH services all from the comfort of your home or on-the-go through our mobile banking app.

                    With fast processing times, your transactions are completed in real-time, ensuring that payments are made without delay. Our platform also supports multiple payment methods, including debit and credit cards, net banking, and wallets, providing you with flexibility.

                    For your security, we use industry-standard protocols like two-factor authentication (2FA) to safeguard your financial data. This ensures that your personal and banking information is protected at all times.

                    Make payments with confidence and ease, knowing that with United Bank, your transactions are both secure and fast.



                </p>
                <button class="custom-button" onclick="window.location.href = 'payments.jsp'">Learn More</button>
            </div>

            <div class="custom-section">
                <u><h2>Cards</h2></u>
                <p style="text-align: center">United Bank offers a range of debit and credit cards designed to provide convenience, security, and a seamless experience for all your financial transactions. Whether you are shopping online, making purchases in-store, or withdrawing cash, our cards are equipped to meet your needs.

                    Our debit cards are linked directly to your checking or savings account, allowing you to access your funds instantly. With contactless payment technology, you can make secure and fast payments without swiping or entering your PIN, making everyday transactions smoother. Our debit cards also come with ATM access, enabling you to withdraw cash from any ATM worldwide.

                    For those who seek flexibility and rewards, our credit cards offer various benefits such as cashback, reward points, and exclusive discounts. With competitive interest rates and a range of credit limits, you can use your card for purchases and enjoy the flexibility of repaying over time. Plus, our credit cards come with added fraud protection, ensuring your transactions are safe from unauthorized use.

                    Both our debit and credit cards come with advanced security features, including EMV chip technology and two-factor authentication, ensuring your data is safe during every transaction. Enjoy the convenience, security, and rewards of United Bank debit and credit cards.</p>
                <button class="custom-button" onclick="window.location.href = 'cards_variety.jsp'">Learn More</button>
            </div>

            <div class="custom-section">
                <u><h2>Loans</h2></u>
                <p style="text-align: center">United Bank offers a range of loan options to help you achieve your financial goals. Whether you are planning for personal needs, purchasing a home, or expanding your business, we provide flexible loan products with competitive interest rates and convenient repayment terms.

                    Our personal loans cater to various needs, such as medical expenses, education, or other personal projects. With minimal paperwork and quick processing, you can access funds when you need them the most.

                    For those looking to buy a home, our home loans provide attractive interest rates and long-term repayment options. Whether it is for purchasing a new home or refinancing, we make the process simple and tailored to fit your budget.

                    We also offer auto loans to help you purchase your desired vehicle, as well as business loans for entrepreneurs and small businesses to expand operations and achieve growth.

                    With easy application processes and flexible terms, United Bank loan options are designed to support your financial journey and help you meet your goals with confidence.



                </p>
                <button class="custom-button" onclick="window.location.href = 'Loan_variety.jsp'">Learn More</button>
            </div>

            <div class="custom-section">
                <u><h2>Investments</h2></u>
                <p style="text-align: center">United Bank offers a variety of investment opportunities designed to help you grow your wealth over time. Whether you are a seasoned investor or just starting, our products are tailored to suit your financial goals and risk tolerance.

                    Fixed Deposits (FDs): Our fixed deposit plans offer guaranteed returns with attractive interest rates. You can choose the tenure that suits your needs, from short-term to long-term investments. FDs are low-risk options for secure growth.

                    Mutual Funds: We offer a wide range of mutual fund options, including equity, debt, and hybrid funds. With professional management and diversified portfolios, mutual funds allow you to invest in the stock market or bonds, providing potential for higher returns based on your risk profile.

                    Stocks and Shares: For investors seeking higher returns and willing to take on more risk, United Bank provides easy access to stock market investments. By purchasing shares in companies, you can benefit from capital appreciation and dividends.

                    Bonds: Our bond investments are ideal for those seeking steady returns with lower risk. We offer both government and corporate bonds, which can provide reliable interest income.

                    Recurring Deposits (RDs): For those who prefer disciplined savings, RDs allow you to invest a fixed sum each month and earn interest, helping you build wealth over time.

                    United Bank diverse investment options allow you to choose the best path for your financial growth. Let us help you invest wisely for a secure future.



                </p>
                <button class="custom-button" onclick="window.location.href = '#Investments'">Learn More</button>
            </div>

            <div class="custom-section">
                <u><h2>Insurance</h2></u>
                <p style="text-align: center">At United Bank, we understand the importance of securing your future and providing peace of mind for you and your loved ones. Our comprehensive insurance plans are designed to protect you against unforeseen circumstances, ensuring that you are financially covered in times of need.

                    Life Insurance: Our life insurance plans offer financial protection for your family in the event of your untimely demise. We provide a range of term and whole life policies, each designed to suit different needs. These plans offer lump sum benefits or monthly income to your beneficiaries, helping them maintain their lifestyle and meet essential financial obligations.

                    Health Insurance: Safeguard your health with our health insurance plans, covering medical expenses, hospitalizations, and treatments. We offer various policies with flexible coverage options to ensure that you receive the care you need, without worrying about the financial burden.

                    Home Insurance: Protect your property with our home insurance plans. Whether you own or rent, our policies cover damages caused by natural disasters, fire, theft, or vandalism, ensuring that your home and belongings are safeguarded.

                    Motor Insurance: Our motor insurance plans provide comprehensive coverage for your vehicles, including protection against accidents, theft, and third-party damages, giving you peace of mind while on the road.

                    Travel Insurance: Travel with confidence by opting for our travel insurance, which covers medical emergencies, trip cancellations, lost baggage, and more, ensuring that your journey is safe and worry-free.

                    United Bank insurance plans are designed to provide comprehensive coverage, helping you protect your assets, health, and loved ones while ensuring peace of mind. Let us help you secure a better future.



                </p>
                <button class="custom-button" onclick="window.location.href = '#Insurance'">Learn More</button>
            </div>



            <!-- Home Page Section: Contact Us -->
            <div class="contact-section">
                <h2>Have Questions?</h2>
                <p>"We are here to assist you with any questions, concerns, or inquiries you may have. Reach out to us anytime for support, and we will be happy to help with anything you need!"</p>
                <u> <a href="contact_us.jsp" style="color: black ;margin-bottom: 50px;">Contact Us</a></u>
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
                function toggleDropdown(event) {
                    event.stopPropagation(); // Prevent the click event from bubbling up
                    const dropdown = event.currentTarget.querySelector('.dropdown');
                    dropdown.style.display = dropdown.style.display === 'block' ? 'none' : 'block'; // Toggle dropdown
                }

                document.addEventListener('click', function () {
                    const dropdowns = document.querySelectorAll('.dropdown');
                    dropdowns.forEach(dropdown => {
                        dropdown.style.display = 'none'; // Hide all dropdowns
                    });
                });

                function toggleLogoutOptions(event) {
                    event.stopPropagation(); // Prevent the click event from bubbling up
                    const logoutOptions = document.querySelector('.logout-options');
                    logoutOptions.style.display = logoutOptions.style.display === 'block' ? 'none' : 'block'; // Toggle logout options
                }

                function confirmLogout() {
                    window.location.href = 'logout.jsp'; // Redirect to logout page
                }

                function cancelLogout() {
                    const logoutOptions = document.querySelector('.logout-options');
                    logoutOptions.style.display = 'none'; // Hide logout options
                }
            </script>

            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
