United Bank Website

Overview

The United Bank Website is a comprehensive online banking platform designed to provide users with essential financial services. The website includes features such as account management, fund transfers, appointment scheduling, and customer support, offering a seamless banking experience.

Features

User Authentication: Secure login and registration system.

Account Management: View account details, balance, and transaction history.

Fund Transfers: Transfer money between accounts securely.

Appointments: Schedule meetings with bank representatives.

Customer Support: Raise complaints, provide feedback, and seek online help.

Admin Panel: Manage users, transactions, and reports.

Technologies Used

Frontend: HTML, CSS, JavaScript, Bootstrap

Backend: Java (Servlets & JSP), JDBC

Database: Apache Derby (Java DB)

Server: Apache Tomcat / TomEE

Installation & Setup

Prerequisites

Java 8 or later

Apache Tomcat / TomEE

Derby Database (Embedded or Network mode)

Eclipse or NetBeans IDE (Recommended)

Steps to Run

Clone the Repository

git clone https://github.com/your-repo/united-bank-website.git

Import the Project into Eclipse/NetBeans

Configure the Database

Start Apache Derby in network mode or use an embedded setup.

Create required tables using the provided SQL scripts.

Deploy the Application

Deploy the WAR file to Apache Tomcat.

Start the server and access http://localhost:8080/UnitedBank/

Database Schema

users Table

Column

Type

Description

user_id

INT (PK)

Unique user ID

name

VARCHAR(100)

Full name

email

VARCHAR(100)

Email address

password

VARCHAR(255)

Hashed password

role

VARCHAR(20)

User role (Customer/Admin)

Contribution

Contributions are welcome! Follow these steps:

Fork the repository

Create a new branch (feature-xyz)

Commit your changes

Push to your branch

Create a Pull Request
