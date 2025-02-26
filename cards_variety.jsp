<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Types of Bank Cards</title>
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

        .card-section {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
            margin: 2em;
            gap: 20px;
        }

        .card {
            background-color: white;
            width: 250px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin: 1em;
            overflow: hidden;
            text-align: center;
            transition: transform 0.3s, box-shadow 0.3s;
            cursor: pointer;
            margin-top: 70px;
            margin-bottom: -20px;
        }

        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
        }

        .card img {
            width: 100%;
            height: 150px;
            object-fit: fill;
        }

        .card h2 {
            color: #333;
            padding: 0.5em;
            font-size: 1.3em;
        }

        .card p {
            padding: 0 1em;
            color: #555;
        }

        .card button {
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

        .card button:hover {
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
            padding-top: 90px;
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

<div class="card-section">
    <!-- Debit Card -->
    <div class="card" onclick="openModal('debitCard', event)">
        <img src="photos/c5.jpg" alt="Debit Card">
        <h2>Debit Card</h2>
        <p>Instant access to your bank funds. Secure transactions and easy payments.</p>
        <a href="debit_cards.jsp"><button onclick="event.stopPropagation();">Learn More</button></a>
    </div>

    <!-- Credit Card -->
    <div class="card" onclick="openModal('creditCard', event)">
        <img src="photos/c0.jpg" alt="Credit Card">
        <h2>Credit Card</h2>
        <p>Shop now, pay later. Avail rewards and cashback offers on every spend.</p>
        <a href="credit_cards.jsp"><button onclick="event.stopPropagation();">Learn More</button></a>
    </div>

    <!-- Forex Card -->
    <div class="card" onclick="openModal('forexCard', event)">
        <img src="photos/c10.jpg" alt="Forex Card">
        <h2>Forex Card</h2>
        <p>Travel worry-free with preloaded foreign currencies. Secure and easy to use.</p>
        <a href="foxex_cards.jsp"><button onclick="event.stopPropagation();">Learn More</button></a>
    </div>

    <!-- Prepaid Card -->
    <div class="card" onclick="openModal('prepaidCard', event)">
        <img src="photos/c7.jpg" alt="Prepaid Card">
        <h2>Prepaid Card</h2>
        <p>Load money in advance and enjoy cashless payments. Ideal for gifting.</p>
        <a href="prepaid_cards.jsp"><button onclick="event.stopPropagation();">Learn More</button></a>
    </div>

    <!-- Transit Card -->
    <div class="card" onclick="openModal('transitCard', event)">
        <img src="photos/c8.jpg" alt="Transit Card">
        <h2>Transit Card</h2>
        <p>Seamless travel with our multi-utility transit card. One card for all your journeys.</p>
        <a href="transit_card.jsp"><button onclick="event.stopPropagation();">Learn More</button></a>
    </div>

    <!-- Commercial Card -->
    <div class="card" onclick="openModal('commercialCard', event)">
        <img src="photos/c9.jpg" alt="Commercial Card">
        <h2>Commercial Card</h2>
        <p>Streamline your business expenses with our versatile commercial card solutions.</p>
        <a href="commercial_card.jsp"><button onclick="event.stopPropagation();">Learn More</button></a>
    </div>
</div>

<!-- Modal for Card Details -->
<div id="modal" class="modal fade-out">
    <div class="modal-content">
        <span class="modal-close" onclick="closeModal()">&times;</span>
        <div id="modal-header" class="modal-header"></div>
        <p id="modal-description"></p>
    </div>
</div>

<script>
    const cardDetails = {
        debitCard: {
            title: "Debit Card",
            description: "A Debit Card allows you to make transactions directly from your savings or current account. It is secure, convenient, and widely accepted."
        },
        creditCard: {
            title: "Credit Card",
            description: "A Credit Card offers you the flexibility to make purchases and pay later. Earn rewards, enjoy cashback offers, and track your spending effectively."
        },
        forexCard: {
            title: "Forex Card",
            description: "Forex Cards are preloaded with foreign currencies and offer secure and hassle-free transactions while traveling abroad."
        },
        prepaidCard: {
            title: "Prepaid Card",
            description: "Prepaid Cards are loaded with a fixed amount of money, allowing for cashless transactions without linking to a bank account."
        },
        transitCard: {
            title: "Transit Card",
            description: "A Transit Card simplifies your daily commute by enabling cashless travel on buses, trains, and metros."
        },
        commercialCard: {
            title: "Commercial Card",
            description: "Commercial Cards are tailored for businesses to manage and streamline corporate expenses with ease."
        }
    };

    // Open Modal
    function openModal(cardType, event) {
        const card = cardDetails[cardType];
        document.getElementById('modal-header').textContent = card.title;
        document.getElementById('modal-description').textContent = card.description;
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
