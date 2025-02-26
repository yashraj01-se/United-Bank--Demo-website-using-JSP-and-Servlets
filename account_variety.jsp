<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Types of Bank Accounts</title>
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

        .deposits-section {
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
            margin: 2em;
            gap: 20px;
        }
        .account-section {
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
            margin: 2em;
            gap: 20px; /* Add gap between cards */
        }

        .account-card {
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

        .account-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
        }

        .account-card img {
            width: 100%;
            height: 150px;
            object-fit: fill;
        }

        .account-card h2 {
            color: #333;
            padding: 0.5em;
            font-size: 1.3em;
        }

        .account-card p {
            padding: 0 1em;
            color: #555;
        }

        .account-card button {
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

        .account-card button:hover {
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

<div class="account-section">
    <!-- Savings Account -->
    <div class="account-card" onclick="openModal('savingsAccount', event)">
        <img src="photos/ac1.jpg" alt="Savings Account">
        <h2>Savings Account</h2>
        <p>Earn interest on your savings with easy access to your funds. Ideal for individuals looking to save for short-term goals.</p>
        <a href="savings_account.jsp"><button onclick="event.stopPropagation();">Learn More</button></a>
    </div>

    <!-- Current Account -->
    <div class="account-card" onclick="openModal('currentAccount', event)">
        <img src="photos/ac2.jpg" alt="Current Account">
        <h2>Current Account</h2>
        <p>Stay in control with unlimited transactions and a range of additional features. Best for businesses and individuals with high transaction volume.</p>
        <a href="current_account.jsp"><button onclick="event.stopPropagation();">Learn More</button></a>
    </div>

    <!-- Salary Account -->
    <div class="account-card" onclick="openModal('salaryAccount', event)">
        <img src="photos/ac(3).jpg" alt="Salary Account">
        <h2>Salary Account</h2>
        <p>Enjoy easy access to your salary payments, with special benefits for employees. No monthly fee and enhanced features.</p>
        <a href="salary_account.jsp"><button onclick="event.stopPropagation();">Learn More</button></a>
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
        savingsAccount: {
            title: "Savings Account",
            description: "Every earning individual must have a savings account and a secure place to store hard-earned money. The primary purpose of a savings account is to provide a valuable medium for people to save money that they will not be using regularly."
        },
        currentAccount: {
            title: "Current Account",
            description: "A Current Account is a non-interest-bearing bank account primarily used by businesses. It allows for high transaction limits on cash deposits and withdrawals, both within and outside the city. Individuals, sole proprietorships, partnership firms, private and public limited companies, HUFs, societies, and trusts can open a Current Account."
        },
        salaryAccount: {
            title: "Salary Account",
            description: "Salary accounts are feature-packed payroll accounts exclusively offered to employers and employees. Read this post to know what it is and what are the top features and benefits of this account."
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
