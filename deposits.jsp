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
            padding-top: 70px; /* Add space for fixed navbar */
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

        .deposits-card {
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

        .deposits-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
        }

        .deposits-card img {
            width: 100%;
            height: 150px;
            object-fit: fill;
        }

        .deposits-card h2 {
            color: #333;
            padding: 0.5em;
            font-size: 1.3em;
        }

        .deposits-card p {
            padding: 0 1em;
            color: #555;
        }

        .deposits-card button {
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

        .deposits-card button:hover {
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
            background-color: rgba(0, 0, 0, 0.6);  /* Dark background with transparency */
            padding-top: 60px;
            opacity: 0;  /* Initial opacity to hide the modal */
            transition: opacity 0.3s ease;
        }

        .modal-content {
            background-color: white;
            margin: auto;
            padding: 20px;
            border-radius: 10px;
            width: 80%;  /* Adjust width to fit nicely */
            max-width: 600px; /* Limit the max width */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            text-align: center;
            padding: 30px; /* Add more padding for better spacing */
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

<div class="deposits-section">
    <div class="deposits-card" onclick="openModal('fixed_deposits', event)">
        <img src="photos/ac1.jpg" alt="fixed_deposits">
        <h2>Fixed Deposit</h2>
        <p>United Bank's Fixed Deposit offers competitive interest rates, flexible tenures, premature withdrawal facility, auto-renewal option, and assured returns, ensuring secure and profitable savings for customers.</p>
        <a href="fixed_deposit.jsp"><button>Learn More</button></a>
    </div>

    <!-- Image inserted here between the deposit cards -->
    <div class="deposits-card" style="width:375px; height: 200px; text-align: center; background-color: white; border-radius: 10px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); margin: 1em; margin-top:130px">
        <img src="photos/d.jpg" alt="Image between sections" style="width: 100%; height: 100%; object-fit: cover;">
    </div>

    <div class="deposits-card" onclick="openModal('recurring_deposits', event)">
        <img src="photos/ac2.jpg" alt="Recurring Deposit">
        <h2>Recurring Deposit</h2>
        <p>United Bank's Recurring Deposit allows systematic monthly savings with flexible tenures, attractive interest rates, easy auto-debit setup, and assured returns, fostering disciplined financial growth for customers.</p>
        <a href="recurring_deposits.jsp"><button>Learn More</button></a>
    </div>
</div>

<!-- Modal for Account Details -->
<div id="modal" class="modal">
    <div class="modal-content">
        <span class="modal-close" onclick="closeModal()">&times;</span>
        <div id="modal-header" class="modal-header"></div>
        <p id="modal-description"></p>
    </div>
</div>

<script>
    const accountDetails = {
        fixed_deposits: {
            title: "Fixed Deposit",
            description: "Fixed deposits are financial instruments where money is invested for a fixed tenure at a predetermined interest rate, offering safe returns and higher rates than savings accounts."
        },
        recurring_deposits: {
            title: "Recurring Deposit",
            description: "Recurring deposits allow individuals to invest a fixed amount monthly for a specific tenure, earning interest, promoting disciplined savings with assured returns upon maturity."
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
