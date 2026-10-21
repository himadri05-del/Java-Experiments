# ShopSphere — Advanced Java E-Commerce Project

A responsive e-commerce web application built with Java 17, Jakarta Servlets/JSP, Maven, Apache Tomcat 11 and MySQL Connector/J. This follows the supplied ShopSphere guide's recommended JSP → Servlet → DAO/JDBC → MySQL structure.

## Features included
- Responsive storefront and product catalogue with seeded product images, category filters and search
- Discounted prices and product stock
- Session-based shopping bag: add, update quantity, remove
- Checkout form and demo Cash on Delivery order placement
- Database-backed orders and order items; stock is reduced in a transaction
- MySQL schema and starter product catalogue
- PreparedStatement for SQL and server-side order total calculation
- Modern responsive CSS, no frontend build step

## Requirements
- JDK 17+
- Apache Maven 3.9+
- MySQL Server 8+
- Apache Tomcat 11
- VS Code with Extension Pack for Java (recommended)

## 1. Create the database
1. Start MySQL.
2. Open MySQL Workbench or a MySQL terminal.
3. Run all statements in `database/shopsphere.sql`.

The script creates `shopsphere`, categories, products, users, orders and order_items, then inserts sample products.

## 2. Configure database credentials
By default the app connects to `jdbc:mysql://localhost:3306/shopsphere` with user `root` and an empty password. If your local MySQL has a password, set environment variables before starting Tomcat:
- `SHOPSPHERE_DB_URL` (optional; default URL shown above)
- `SHOPSPHERE_DB_USER` (default `root`)
- `SHOPSPHERE_DB_PASSWORD` (your MySQL password)

Windows PowerShell example for the current terminal:
```powershell
$env:SHOPSPHERE_DB_USER="root"
$env:SHOPSPHERE_DB_PASSWORD="your_mysql_password"
```
Do not commit real database passwords into source control.

## 3. Build in VS Code terminal
Open the `ShopSphere` folder (the folder containing `pom.xml`) in VS Code. Run:
```powershell
mvn clean package
```
Expected output: `BUILD SUCCESS`. Maven creates `target/ShopSphere.war`.

## 4. Deploy to Tomcat 11
Copy `target/ShopSphere.war` into Tomcat's `webapps` folder, then start/restart Tomcat. Open:
`http://localhost:8080/ShopSphere/`

If Tomcat is on a different port, replace `8080`. Use **Tomcat 11**, because this project uses `jakarta.servlet.*`. Do not use Tomcat 9 with this version.

## 5. Try the flow
1. Open Shop.
2. Search or choose a category.
3. Add a product to the bag.
4. Update/remove quantities on the bag page.
5. Complete checkout using test details. No real payment is taken.
6. A successful order appears in MySQL `orders` and `order_items`.

## Common problems
- **HTTP 404:** Confirm the file is `ShopSphere.war` inside `webapps`, wait for Tomcat to expand it, and use `/ShopSphere/` (capitalization matters on some systems). Check Tomcat logs if it does not expand.
- **Database connection error:** Verify MySQL is running, the database script was executed, and credentials are correct.
- **`mvn` not recognized:** Install Maven and add its `bin` folder to PATH, or use the Maven wrapper if you add one.
- **Servlet class errors:** Use JDK 17+ and Tomcat 11; the project intentionally uses `jakarta.*`, not legacy `javax.*`.
- **Images do not appear:** Product photos are hosted remotely and require an internet connection.

## Project structure
```text
ShopSphere/
├── pom.xml
├── README.md
├── database/shopsphere.sql
└── src/main/
    ├── java/com/shopsphere/
    │   ├── controller/   # Servlet controllers
    │   ├── dao/          # JDBC data access
    │   ├── model/        # Product and CartItem
    │   └── util/         # Database connection
    └── webapp/
        ├── index.jsp
        ├── products.jsp
        ├── cart.jsp
        ├── checkout.jsp
        ├── order-success.jsp
        ├── fragments/
        └── css/style.css
```

## Important project scope note
This is a runnable core web version of the broader syllabus project guide. Registration/login, admin CRUD, Swing admin, Socket, RMI, internationalization and extra JSTL demonstrations are not implemented in this starter package yet. They can be added as separate modules after the storefront/cart/checkout flow is working. For a college demo, describe payment as simulated Cash on Delivery, not a real payment gateway.
