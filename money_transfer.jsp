<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fund Transfer</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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

        .navbar .logo-container {
            display: flex;
            align-items: center;
        }

        .navbar .logo {
            font-size: 1.5em;
            font-weight: bold;
            margin-left: 10px;
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

        /* Transfer Section */
        .transfer-section {
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
            margin-top: 100px;
        }

        .transfer-section img {
            width: 1000px;
            height: 400px;
            object-fit: cover;
        }

        .transfer-form-container {
            background-color: rgba(255, 255, 255, 0.9);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            width: 400px;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: black;
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            font-size: 0.85rem;
        }

        input, select {
            width: 90%;
            padding: 8px;
            font-size: 0.85rem;
            border: none;
            border-bottom: 1px solid #ccc;
            outline: none;
            margin-top: 5px;
        }

        .submit-btn {
            width: 100%;
            padding: 10px;
            background-color: black;
            color: white;
            font-size: 0.9rem;
            font-weight: bold;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .submit-btn:hover {
            background-color: gray;
        }

        .message {
            padding: 10px;
            margin-bottom: 20px;
            border-radius: 5px;
            text-align: center;
            font-size: 1rem;
        }

        .error-message {
            background-color: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }

        .success-message {
            background-color: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }

        .info-section {
            padding: 20px;
            background-color: white;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            margin-top: 30px;
            border-radius: 10px;
            margin-bottom: 50px;
        }

        .features-section {
            padding: 20px;
            margin-top: 10px;
            text-align: left;
        }

        .steps-section ul {
            padding-left: 20px;
        }

        .steps-section li {
            margin-bottom: 10px;
        }

        .dynamic-images {
            display: none;
            margin-top: 20px;
            text-align: center;
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
    <script>
        function toggleReceiverField() {
            const transactionType = document.getElementById("transactionType").value;
            const receiverAccountField = document.getElementById("receiverAccountField");
            const submitButton = document.getElementById("submitButton");

            if (transactionType === "Transfer") {
                receiverAccountField.style.display = "block";
                submitButton.textContent = "Transfer Funds";
            } else {
                receiverAccountField.style.display = "none";
                submitButton.textContent = "Deposit Funds";
            }
        }

        function showDynamicImages() {
            const transactionType = document.getElementById('transactionType').value;
            const dynamicImagesDiv = document.getElementById('dynamicImages');

            if (transactionType === 'Transfer') {
                dynamicImagesDiv.innerHTML = `
                    <img src="photos/transfer1.jpg" alt="Transfer Image 1">
                    <img src="photos/transfer2.jpg" alt="Transfer Image 2">
                    <p>Transfer your funds quickly and securely!</p>
                `;
            } else if (transactionType === 'Deposit') {
                dynamicImagesDiv.innerHTML = `
                    <img src="photos/deposit1.jpg" alt="Deposit Image 1">
                    <img src="photos/deposit2.jpg" alt="Deposit Image 2">
                    <p>Make deposits with ease!</p>
                `;
            }

            dynamicImagesDiv.style.display = 'block';
        }
        
    function validateForm() {
        const amount = document.getElementById('amount').value;
        console.log("Amount being submitted: " + amount); // Debugging line
    }


    </script>
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

    <!-- Transfer Section -->
    <div class="transfer-section container">
        <img src="photos/p5.jpg" alt="Fund Transfer" class="img-fluid">
        <div class="transfer-form-container">
            <h2>Fund Transfer</h2>

            <%-- Display messages --%>
            <% 
                String error = request.getParameter("error");
                String success = request.getParameter("success");
            %>
            <% if (error != null && error.equals("error")) { %>
                <div class="message error-message">
                    There is an error while transaction. Please try again.
                </div>
            <% } %>
            <% if (error != null && error.equals("unauthorized")) { %>
                <div class="message error-message">
                   Please enter valid credentials.
                </div>
            <% } %>
            <% if (success != null && success.equals("success")) { %>
                <div class="message success-message">
                  Transaction successful.Thank You for Banking With us.Please visit the nearest branch with valid paperwork.
                </div>
            <% } %>

            <form action="FundTransferServlet" method="POST" onsubmit="validateForm()">
                <div class="form-group">
                    <div id="Username" class="form-group">
                    <label for="Username">Username</label>
                    <input type="text" id="Username" name="Username" placeholder="Enter your Username">
                </div>
                    <label for="transactionType">Transaction Type</label>
                    <select id="transactionType" name="transactionType" onchange="toggleReceiverField()" required>
                        <option value="Transfer">Transfer</option>
                        <option value="Deposit">Deposit</option>
                    </select>
                </div>

                <div id="receiverAccountField" class="form-group">
                    <label for="receiverAccount">Receiver's Account Number</label>
                    <input type="text" id="receiverAccount" name="receiverAccount" placeholder="Enter receiver's account number">
                </div>

                <div class="form-group">
                    <label for="senderAccount">Your Account Number</label>
                    <input type="text" id="senderAccount" name="senderAccount" placeholder="Enter your account number" required>
                </div>

                <div class="form-group">
                    <label for="amount">Amount</label>
                    <input type="number" id="amount" name="amount" placeholder="Enter amount to transfer" required step="0.01">
                </div>

                <div class="form-group">
                    <label for="remarks">Remarks (Optional)</label>
                    <input type="text" id="remarks" name="remarks" placeholder="Add a note">
                </div>

                <button type="submit" id="submitButton" class="submit-btn">Transfer Funds</button>
            </form>
        </div>
    </div>

    <!-- Dynamic Images Section -->
    <div class="dynamic-images" id="dynamicImages"></div>

    <!-- Transfer Information Section -->
    <div class="info-section container">
        <u><h2 class="text-center mb-4">About Fund Transfer</h2></u>
        <p>Fund transfer allows you to securely send money to other accounts. United Bank ensures a smooth and reliable process for transferring funds to any account, be it within the bank or other banks.</p>
        <ul>
            <li>Fast and secure transactions.</li>
            <li>Available 24/7 for your convenience.</li>
            <li>Multiple options for transactions.</li>
        </ul>
    </div>

    <div class="features-section container">
        <h2 class="text-center">How to Transfer Funds</h2>
        <div class="steps-section">
            <ul>
                <li>Select the transaction type.</li>
                <li>Enter the required account numbers.</li>
                <li>Specify the amount you want to transfer.</li>
                <li>Click on 'Transfer Funds' to complete the process.</li>
            </ul>
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

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
