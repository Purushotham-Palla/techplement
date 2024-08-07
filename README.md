---

# Techplement - Week 1 Tasks: Quote of the Day

## Project Overview

This project is a simple "Quote of the Day" website that allows users to view random quotes from an API and search for quotes by author name. The website is built using JSP for the front-end and MySQL for the back-end database. It also includes a users table for managing user registrations and logins.

## Features

- Display a random quote from an API.
- Allow users to search for quotes by author name.
- Implement both front-end and back-end functionalities.
- Responsive user interface.
- User registration and login system.

## Technologies Used

- **Frontend**: JSP, HTML, CSS
- **Backend**: Java Servlets, JSP
- **Database**: MySQL
- **API**: Integration with a quote API for fetching random quotes

## Database Schema

### Users Table

```sql
CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(200) NOT NULL UNIQUE,
    password VARCHAR(200) NOT NULL
);
```

## Setup and Installation

### Prerequisites

- Java Development Kit (JDK) installed
- Apache Tomcat server installed
- MySQL server installed
- Maven installed (if you're using Maven for project management)

### Steps

1. **Clone the repository**

   ```
   git clone https://github.com/Purushotham-Palla/techplement.git
  
   ```

2. **Set up the database**

   - Create a database named `quote_db`.
   - Execute the MYSQL to create the `users` table.

   ```sql
   CREATE DATABASE quote_db;
   USE quote_db;

   CREATE TABLE users (
       id INT PRIMARY KEY AUTO_INCREMENT,
       name VARCHAR(200) NOT NULL UNIQUE,
       password VARCHAR(200) NOT NULL
   );
   ```

3. **Configure the database connection**

   - Update the database connection settings in the `web.xml` or the respective configuration file.

4. **Deploy the application**

   - Package the application using your build tool (e.g., Maven).
   - Deploy the WAR file to your Apache Tomcat server.

5. **Run the application**

   - Start the Apache Tomcat server.
   - Access the application at `http://localhost:8080/your-app-name`.

## API Integration

The application fetches random quotes from an external API. Ensure that the API endpoint is correctly configured in your application code.

## Demonstration

A video demonstration of the project can be found [here](https://drive.google.com/file/d/17xBKFXeFC5aaAu0MbyGYWGB1Vgr_IWkf/view?usp=drivesdk).

## Contributions

Contributions are welcome! Please fork the repository and submit a pull request for any improvements or bug fixes.

## License

This project is licensed under the MIT License.

## Contact

For any questions or feedback, please contact ppurushotham2001@gmail.com.

---
