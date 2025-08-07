# TOUR-AND-PLANAERS

**TOUR-AND-PLANAERS** is a complete Java-based web application built to help users book and manage travel packages online. Designed using Servlet, JSP, HTML, CSS, and MySQL, it provides both users and admin with functionalities for planning trips, managing bookings, and maintaining package data.

---

##  Key Features

###  User Features:
- View all available tour packages.
- Book a tour package by filling in details.
- Delete a booking if needed.
- View confirmation messages after successful operations.

###  Admin Features:
- Add new tour packages to the system.
- Delete existing tour packages.
- Maintain the overall data consistency via a connected MySQL database.

---

##  Technologies Used

| Technology     | Description                         |
|----------------|-------------------------------------|
| Java           | Backend logic using Servlets        |
| JSP            | Dynamic content rendering           |
| HTML/CSS       | Frontend user interface             |
| MySQL          | Relational database management      |
| Apache Tomcat  | Server to host the servlet project  |

---

## 🗂 Project Structure

```
TOUR-AND-PLANAERS/
├── src/
│   ├── BookPackageServlet1.java       # Handles booking functionality
│   ├── DeletePackageServlet.java      # Handles booking deletion
│   ├── DBConfig.java                  # JDBC connection setup
│   └── AddPackageServlet.java         # (optional) Admin-side feature
├── WebContent/
│   ├── Dashboard.html                 # Homepage interface
│   ├── BookingPage.jsp                # Tour booking page
│   ├── delete.html                    # Booking delete UI
│   └── confirmation.html              # Booking success page
├── tour.sql                           # SQL file to create necessary tables
└── README.md
```

---

## 🧩 How to Run the Project

1. **Clone the Repository**
```bash
git clone https://github.com/manishahazra/TOUR-AND-PLANAERS.git
cd TOUR-AND-PLANAERS


2. **Set Up the MySQL Database**
   - Create a database named `tour`
   - Use the provided `tour.sql` file to create required tables and insert sample data

3. **Configure JDBC in Servlet Files**
   - In `DBConfig.java` or wherever database connection is written, update the following:
```java
String url = "jdbc:mysql://localhost:3306/tour";
String user = "root";
String password = "your_password";


4. **Deploy the Project using Apache Tomcat**
   - Import the project into an IDE like Eclipse or IntelliJ (with Java EE plugin)
   - Run the server and deploy the project
   - Access the homepage via: `http://localhost:8080/TOUR-AND-PLANAERS/`



##  Sample Database Table

**Table: bookings**
sql
CREATE TABLE bookings (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100),
  email VARCHAR(100),
  package_name VARCHAR(100),
  booking_date DATE
);

You can add more tables for admin and packages depending on features.

---

##  About the Developer

**Manisha Hazra**  
📌 Passionate about full-stack web development and Java-based backend systems.  
🔗 GitHub: [@manishahazra](https://github.com/manishahazra)

---

##  License

This project is open-source and free to use for educational and learning purposes.

---

 Thank you for visiting this repository! Feel free to explore, suggest improvements, or contribute.
