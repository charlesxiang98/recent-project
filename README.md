# recent-project
Recent project for coupon microservice demo

There are three entities:

Admin – can create, read, update, delete companies, coupons and customers.
Company – can create, read, update, delete coupons.
Customer – can check available coupons, purchase them and check list of purchased coupons.
Used technologies:
Backend:

Data access: Spring boot & Spring Data JPA.
Database: MySQL.
Build tool: Maven.
Frontend:

Framework: Angular 8.
Libraries: animate.css, materialize-css.
Build tool: npm.
Instructions:
1.Go to "client" folder and run "npm i" to install Node dependecies, after that you have to run MySQL server and client side server in Angular by using command “npm start”. 
You can login like admin(username and password – “admin”) or just to register new company or customer.

2. Database Access:

The credentials for the connection profile are

URL: jdbc:mysql://localhost:3306/coupon_system?createDatabaseIfNotExist=true&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC

username: root

password: root

These credentials can also be found in src/main/resources/application.properties

