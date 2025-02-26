<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Types of Investment Options</title>
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

        .investment-section {
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
            margin: 2em;
            gap: 20px;
        }

        .investment-card {
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

        .investment-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
        }

        .investment-card img {
            width: 100%;
            height: 150px;
            object-fit: fill;
        }

        .investment-card h2 {
            color: #333;
            padding: 0.5em;
            font-size: 1.3em;
        }

        .investment-card p {
            padding: 0 1em;
            color: #555;
        }

        .investment-card button {
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

        .investment-card button:hover {
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

<div class="investment-section">
    <!-- Mutual Funds -->
    <div class="investment-card" onclick="openModal('mutualFunds', event)">
        <img src="photos/io.jpg" alt="Mutual Funds">
        <h2>Mutual Funds</h2>
        <p>Mutual funds pool money from various investors to invest in a diversified portfolio of stocks, bonds, or other assets. Managed by professionals, these funds aim for moderate risk and high returns. They are ideal for investors looking for diversification, who prefer a hands-off approach to investing and are long-term focused.</p>
        <a href="mutual.jsp"><button onclick="event.stopPropagation();">Learn More</button></a>
    </div>

    <!-- Stock Market Investment -->
    <div class="investment-card" onclick="openModal('stockMarket', event)">
        <img src="photos/oi1.jpg" alt="Stock Market">
        <h2>Stock Market Returns</h2>
        <p>Investing in stocks offers high return potential but comes with significant volatility. Stock prices can fluctuate rapidly based on market conditions. This option is best suited for experienced investors who understand market dynamics and are willing to take calculated risk carefully everytime in todays world effectively.</p>
        <a href="stock_market.jsp"><button onclick="event.stopPropagation();">Learn More</button></a>
    </div>

    <!-- Real Estate Investment -->
    <div class="investment-card" onclick="openModal('realEstate', event)">
        <img src="photos/oi2.jpg" alt="Real Estate Investment">
        <h2>Real Estate Investment</h2>
        <p>Real estate investment allows you to grow wealth by purchasing property, offering both capital appreciation and rental income potential. As a long-term investment, it provides stability and security. Real estate can be a tangible, income-generating asset, making it an ideal choice for investors seeking steady returns.</p>
        <a href="real_estate.jsp"><button onclick="event.stopPropagation();">Learn More</button></a>
    </div>
    
    <!-- Demat Account -->
    <div class="investment-card" onclick="openModal('dematAccount', event)">
        <img src="photos/oi3.jpg" alt="Demat Account">
        <h2>Demat Account</h2>
        <p>A Demat Account enables you to hold your securities, like stocks and bonds, electronically. It simplifies the process of buying and selling in the market, eliminating the need for physical certificates. This account offers a secure and efficient way to manage investments, making trading easier,faster and accurately everytime.</p>
        <a href="demat_account.jsp"><button onclick="event.stopPropagation();">Learn More</button></a>
    </div>
</div>

<!-- Modal for Investment Details -->
<div id="modal" class="modal fade-out">
    <div class="modal-content">
        <span class="modal-close" onclick="closeModal()">&times;</span>
        <div id="modal-header" class="modal-header"></div>
        <p id="modal-description"></p>
    </div>
</div>

<script>
    const investmentDetails = {
        mutualFunds: {
            title: "Mutual Funds",
            description: "Mutual Funds pool money from several investors to invest in a diversified portfolio of stocks, bonds, and other securities. Suitable for those looking for professional management of their investments."
        },
        stockMarket: {
            title: "Stock Market Investment",
            description: "Investing in stocks involves purchasing shares of publicly traded companies. Though it carries more risk, it offers the potential for significant returns over time."
        },
        realEstate: {
            title: "Real Estate Investment",
            description: "Real estate investments allow you to buy, own, or lease properties for profit. It is one of the most lucrative long-term investment options, with potential for rental income and appreciation."
        },
        dematAccount: {
            title: "Demat Account",
            description: "A Demat account holds your securities in electronic form, eliminating the need for physical certificates. It facilitates quick and secure trading in stocks, bonds, and other market instruments."
        }
    };

    // Open Modal
    function openModal(investmentType, event) {
        const investment = investmentDetails[investmentType];
        document.getElementById('modal-header').textContent = investment.title;
        document.getElementById('modal-description').textContent = investment.description;
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
