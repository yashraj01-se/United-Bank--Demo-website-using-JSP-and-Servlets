<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Types of Loans</title>
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

        .navbar .logo {
            font-size: 1.5em;
            font-weight: bold;
            margin-left: 10px; 
        }

        .loan-section {
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
            margin: 2em;
            gap: 20px;
        }

        .loan-card {
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

        .loan-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
        }

        .loan-card img {
            width: 100%;
            height: 150px;
            object-fit: fill;
        }

        .loan-card h2 {
            color: #333;
            padding: 0.5em;
            font-size: 1.3em;
        }

        .loan-card p {
            padding: 0 1em;
            color: #555;
        }

        .loan-card button {
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

        .loan-card button:hover {
            background-color: gray;
        }

        /* Modal Styles */
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100vw;  /* Full width of the viewport */
            height: 100vh; /* Full height of the viewport */
            background-color: rgba(0, 0, 0, 0.4);  /* Dark background with transparency */
            padding-top: 60px;
            opacity: 0;  /* Initial opacity to hide the modal */
            transition: opacity 0.3s ease;
        }

        .modal-content {
            background-color: white;
            margin: auto;
            padding: 20px;
            border-radius: 10px;
            width: 100%;  /* Full width of the modal container */
            max-width: 600px; /* Limit the max width */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .modal-close {
            color: #aaa;
            font-size: 28px;
            font-weight: bold;
            position: absolute;
            top: 10px;
            right: 20px;
        }

        .modal-close:hover,
        .modal-close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }

        .modal-header {
            font-size: 1.5em;
            margin-bottom: 10px;
        }

        /* Modal Fade In/Out */
        .modal.fade-in {
            display: block;
            opacity: 1;  /* Make the modal visible */
        }

        .modal.fade-out {
            display: none;
            opacity: 0;  /* Keep it hidden when closed */
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

<div class="loan-section">
    <!-- Personal Loan -->
    <div class="loan-card" onclick="openModal('personalLoan', event)">
        <img src="photos/bn1.jpg" alt="Personal Loan">
        <h2>Personal Loan</h2>
        <p>Get access to funds for your personal needs with competitive interest rates and flexible repayment options. Quick approval and easy processing.</p>
        <a href="personal_loan.jsp"><button onclick="event.stopPropagation();">Learn More</button></a>
    </div>

    <!-- Home Loan -->
    <div class="loan-card" onclick="openModal('homeLoan', event)">
        <img src="photos/bn2.jpg" alt="Home Loan">
        <h2>Home Loan</h2>
        <p>Secure your dream home with attractive home loan options. Flexible repayment terms and competitive interest rates to make your purchase easy and affordable.</p>
        <a href="home_loan.jsp"><button onclick="event.stopPropagation();">Learn More</button></a>
    </div>

    <!-- Car Loan -->
    <div class="loan-card" onclick="openModal('carLoan', event)">
        <img src="photos/bn3.jpg" alt="Car Loan">
        <h2>Car Loan</h2>
        <p>Drive your dream car with a car loan that suits your budget. Quick approval, competitive rates, and easy terms for a hassle-free experience.</p>
        <a href="car_loan.jsp"><button onclick="event.stopPropagation();">Learn More</button></a>
    </div>

    <!-- Education Loan -->
    <div class="loan-card" onclick="openModal('educationLoan', event)">
        <img src="photos/bn4.jpg" alt="Education Loan">
        <h2>Education Loan</h2>
        <p>Invest in your future with an education loan.United Bank offers you Low-interest rates and flexible repayment options to support your academic journey.</p>
        <a href="education_loan.jsp"><button onclick="event.stopPropagation();">Learn More</button></a>
    </div>

    <!-- Business Loan -->
    <div class="loan-card" onclick="openModal('businessLoan', event)">
        <img src="photos/bn5.jpg" alt="Business Loan">
        <h2>Business Loan</h2>
        <p>Fuel your business growth with a business loan that offers competitive interest rates and flexible repayment terms for all types of businesses.</p>
        <a href="business_loan.jsp"><button onclick="event.stopPropagation();">Learn More</button></a>
    </div>

    <!-- Emergency Loan -->
    <div class="loan-card" onclick="openModal('emergencyLoan', event)">
        <img src="photos/bn6.jpg" alt="Emergency Loan">
        <h2>Emergency Loan</h2>
        <p>Access funds quickly in case of emergency. No collateral required with fast approval and flexible repayment terms.Get the financial support you need without the hassle.</p>
        <a href="emergency_loan.jsp"><button onclick="event.stopPropagation();">Learn More</button></a>
    </div>
</div>

<!-- Modal for Loan Details -->
<div id="modal" class="modal fade-out">
    <div class="modal-content">
        <span class="modal-close" onclick="closeModal()">&times;</span>
        <div id="modal-header" class="modal-header"></div>
        <p id="modal-description"></p>
    </div>
</div>

<script>
    const loanDetails = {
        personalLoan: {
            title: "Personal Loan",
            description: "Get quick access to funds for personal needs with competitive interest rates, flexible repayment terms, and a simple application process for fast approval and disbursal."
        },
        homeLoan: {
            title: "Home Loan",
            description: "United Bank offers home loans with flexible repayment terms, competitive interest rates, and options for purchasing or constructing a home, ensuring affordable financing solutions."
        },
        carLoan: {
            title: "Car Loan",
            description: "United Bank offers car loans with flexible repayment terms, competitive interest rates, and financing for new or used cars, making vehicle ownership affordable."
        },
        educationLoan: {
            title: "Education Loan",
            description: "United Bank offers education loans with competitive interest rates, flexible repayment options, and funding for tuition, living expenses, and other education-related costs."
        },
        businessLoan: {
            title: "Business Loan",
            description: "United Bank offers business loans with flexible terms, competitive interest rates, and financing for growth, working capital, or expansion, helping businesses achieve their goals."
        },
        emergencyLoan: {
            title: "Emergency Loan",
            description: "United Bank offers emergency loans with quick approval, flexible repayment options, and competitive interest rates to help individuals manage urgent financial needs or unexpected expenses."
        }
    };

    // Open Modal
    function openModal(loanType, event) {
        // Prevent modal opening when clicking on "Learn More" button
        const loan = loanDetails[loanType];
        document.getElementById('modal-header').textContent = loan.title;
        document.getElementById('modal-description').textContent = loan.description;
        const modal = document.getElementById('modal');
        modal.style.display = "block";
        setTimeout(function() {
            modal.classList.remove("fade-out");
            modal.classList.add("fade-in");
        }, 10);
    }

    // Close Modal
    function closeModal() {
        const modal = document.getElementById('modal');
        modal.classList.remove("fade-in");
        modal.classList.add("fade-out");
        setTimeout(function() {
            modal.style.display = "none";
        }, 300); // Wait for fade-out animation to finish
    }

    // Close modal if clicked outside the modal
    window.onclick = function(event) {
        if (event.target === document.getElementById('modal')) {
            closeModal();
        }
    };
</script>

</body>
</html>
