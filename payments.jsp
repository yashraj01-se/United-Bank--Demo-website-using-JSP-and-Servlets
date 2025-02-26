<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payments</title>
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

        .payment-section {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin: 2em;
            gap: 20px; /* Gap between items */
        }

        .payment-card {
            background-color: white;
            width: 300px; /* Adjusted width for the payment card */
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
            transition: transform 0.3s, box-shadow 0.3s;
            cursor: pointer;
            flex: 1; /* Allow the payment card to grow and occupy space */
            margin: 0; /* Remove margin from payment card */
        }

        .payment-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
        }

        .payment-card img {
            width: 100%;
            height: 150px;
            object-fit: fill;
        }

        .payment-card h2 {
            color: #333;
            padding: 0.5em;
            font-size: 1.3em;
        }

        .payment-card p {
            padding: 0 1em;
            color: #555;
        }

        .payment-card {
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

        .payment-card button {
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

        .payment-card button:hover {
            background-color: gray;
        }

        /* Image Section Styles */
        .image-card {
            flex: 1; /* Allow images to grow and occupy space equally */
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s; /* Transition for zoom effect */
        }

        .image-card img {
            width: 100%;
            height: 200px; /* Adjusted height for better visibility */
            object-fit: cover;
            transition: transform 0.3s; /* Smooth transition for zoom effect */
        }

        .image-card:hover img {
            transform: scale(1.1); /* Zoom effect on hover */
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

<div class="payment-section">
    <!-- Left Image -->
    <div class="image-card">
        <img src="photos/p4.jpg" alt="Account Type 1">
    </div>

    <!-- Payments Card -->
    <div class="payment-card" onclick="openModal('payment', event)">
        <img src="photos/p1.jpg" alt="Payments">
        <h2>Payments</h2>
        <p>United Bank offers a seamless payment system, allowing customers to make secure transactions, manage accounts online, and receive instant notifications for transactions and confirmations.</p>
        <a href="money_transfer.jsp"><button onclick="event.stopPropagation();">Learn More</button></a>
    </div>

    <!-- Right Image -->
    <div class="image-card">
        <img src="photos/p3.jpg" alt="Account Type 2">
    </div>
</div>

<!-- Modal for Account Details -->
<div id="modal" class="modal fade-out">
    <div class="modal-content">
        <span class="modal-close" onclick="closeModal()">&times;</span>
        <div id="modal-header" class="modal-header"></div>
        <p id="modal-description"></p>
    </div>
</div>

<script>
    const accountDetails = {
        payment: {
            title: "Payments",
            description: "Implement a secure payment feature enabling users to make transactions, validate account details, and process payments through a user-friendly interface with transaction confirmations."
        }
    };

    // Open Modal
    function openModal(accountType, event) {
        // Prevent modal opening when clicking on "Learn More" button
        const account = accountDetails[accountType];
        document.getElementById('modal-header').textContent = account.title;
        document.getElementById('modal-description').textContent = account.description;
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
        }, 300); // Match timeout with the CSS transition duration
    }
</script>

</body>
</html>
