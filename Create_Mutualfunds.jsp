<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Mutual Funds</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: whitesmoke;
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: flex-start;
                height: 100%;
                text-align: center;
            }

            header {
                background-color: white;
                color: black;
                padding: 1em 0;
                text-align: center;
                display: flex;
                align-items: center;
                justify-content: center;
                gap: 10px;
                width: 100%;
                z-index: 2; /* Ensure header stays on top */
            }

            header h1 {
                margin: 0;
                font-size: 1.8em;
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
            /* General Page Styling */
body {
    font-family: Arial, sans-serif;
    background-color: #fff8f2;
    margin: 0;
    padding: 0;
    color: #333;
}


h1 {
    text-align: center;
    font-size: 32px;
    color: black;
    margin-top: 20px;
    text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.1);
    animation: fadeIn 2s ease-in-out;
}



/* Form Container */
form {
    max-width: 600px;
    margin: 30px auto;
    background: linear-gradient(to bottom, #ffffff, #f8f9fa);
    border: 1px solid black;
    border-radius: 12px;
    padding: 20px;
    box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
    transition: transform 0.3s ease-in-out;
}

form:hover {
    transform: translateY(-5px);
}

/* Labels */
label {
    font-size: 16px;
    color: black;
    font-weight: 500;
}

/* Sliders */
input[type="range"] {
    -webkit-appearance: none;
    width: 100%;
    height: 8px;
    border-radius: 5px;
    background: linear-gradient(to right, whitesmoke, black);
    outline: none;
    margin: 10px 0;
    transition: background 0.3s ease;
}

input[type="range"]::-webkit-slider-thumb {
    -webkit-appearance: none;
    width: 20px;
    height: 20px;
    border-radius: 50%;
    background: #ffffff;
    cursor: pointer;
    border: 2px solid black;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
    transition: transform 0.3s ease, background-color 0.3s ease;
}

input[type="range"]:hover::-webkit-slider-thumb {
    background-color: black;
    transform: scale(1.1);
}

input[type="range"]::-moz-range-thumb {
    width: 20px;
    height: 20px;
    border-radius: 50%;
    background: #ffffff;
    cursor: pointer;
    border: 2px solid black;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
}

input[type="range"]:hover::-moz-range-thumb {
    background-color: black;
    transform: scale(1.1);
}

/* Span Styling for Values */
span {
    display: inline-block;
    font-size: 18px;
    font-weight: bold;
    color: #555;
    margin-top: 5px;
    text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.1);
}

/* Calculate Button */
button {
    display: block;
    width: 100%;
    padding: 12px;
    background: linear-gradient(to right, whitesmoke, black);
    color: #ffffff;
    font-size: 18px;
    font-weight: 600;
    border: none;
    border-radius: 8px;
    cursor: pointer;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    transition: background 0.3s ease, transform 0.3s ease;
}

button:hover {
    background: linear-gradient(to right, black, whitesmoke);
    transform: translateY(-3px);
}

/* Result Section */
#result {
    text-align: center;
    font-size: 20px;
    color: black;
    font-weight: bold;
    margin-top: 20px;
    text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.1);
    animation: popIn 0.5s ease-in-out;
}

/* Animations */
@keyframes fadeIn {
    from {
        opacity: 0;
    }
    to {
        opacity: 1;
    }
}

@keyframes popIn {
    from {
        transform: scale(0.8);
        opacity: 0;
    }
    to {
        transform: scale(1);
        opacity: 1;
    }
}


</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
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
        <!-- Header -->
    <div class="container my-4">
        <h1 class="text-center text-dark">Investment Returns Calculator</h1>
    </div>

    <!-- Form -->
    <div class="container">
        <form id="sipCalculatorForm" class="bg-white p-4 rounded shadow-sm">
            <!-- Target Amount -->
            <div class="mb-3">
                <u><label for="targetAmount" class="form-label">Target Amount</label></u>
                <input type="range" class="form-range" id="targetAmount" name="targetAmount" min="500" max="10000000" step="500" oninput="updateTargetValue(this.value)">
                <span id="targetAmountValue" class="text-dark">15,000,000</span>
            </div>

            <!-- Duration -->
            <div class="mb-3">
                <u> <label for="duration" class="form-label">Duration (Years)</label></u>
                <input type="range" class="form-range" id="duration" name="duration" min="1" max="50" step="1" oninput="updateDurationValue(this.value)">
                <span id="durationValue" class="text-dark">10 Years</span>
            </div>

            <!-- Interest Rate -->
            <div class="mb-3">
                <u> <label for="interestRate" class="form-label">Illustrative Interest Rate (%)</label></u>
                <input type="range" class="form-range" id="interestRate" name="interestRate" min="2" max="20" step="0.1" oninput="updateInterestValue(this.value)">
                <span id="interestRateValue" class="text-dark">12%</span>
            </div>

            <!-- Calculate Button -->
            <button type="button" class="btn btn-dark w-100" onclick="calculateSIP()">Calculate</button>
        </form>
    </div>

    <!-- Result Section -->
    <div class="container text-center my-4">
        <p id="result" class="fs-5 text-success fw-bold"></p>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Custom Script -->
    <script>
        function updateTargetValue(value) {
            document.getElementById('targetAmountValue').textContent = '' + parseInt(value).toLocaleString();
        }

        function updateDurationValue(value) {
            document.getElementById('durationValue').textContent = value + ' Years';
        }

        function updateInterestValue(value) {
            document.getElementById('interestRateValue').textContent = value + '%';
        }

        function calculateSIP() {
            const targetAmount = document.getElementById('targetAmount').value;
            const duration = document.getElementById('duration').value;
            const interestRate = document.getElementById('interestRate').value;

            const monthlyRate = interestRate / 12 / 100;
            const months = duration * 12;
            const sip = (targetAmount * monthlyRate) / (Math.pow(1 + monthlyRate, months) - 1);

            document.getElementById('result').textContent = `You will have to invest ? ${sip.toFixed(2)} per month to achieve your goal.`;
        }
    </script>
</body>
</html>
