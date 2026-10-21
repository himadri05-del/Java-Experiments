import java.sql.*;

public class JdbcDemo {
    public static void main(String[] args) {
        // Database credentials and URL
        String url = "jdbc:mysql://localhost:3306/college";
        String user = "root";
        String password = "root";

        // SQL queries
        String insertQuery = "INSERT INTO student VALUES (?, ?, ?)";
        String selectQuery = "SELECT * FROM student";

        try {
            // 1. Load the MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // 2. Establish connection and prepare statements (Try-with-resources auto-closes them)
            try (Connection con = DriverManager.getConnection(url, user, password);
                 PreparedStatement ps = con.prepareStatement(insertQuery);
                 Statement st = con.createStatement()) {

                // 3. Set parameters for insertion
                ps.setInt(1, 101);
                ps.setString(2, "Rahul");
                ps.setString(3, "CSE");

                // 4. Execute the insert operation
                int rowsAffected = ps.executeUpdate();
                System.out.println("Record Inserted. Rows affected: " + rowsAffected);

                // 5. Execute the select query to view the updated table
                try (ResultSet rs = st.executeQuery(selectQuery)) {
                    System.out.println("\n--- Student Table Records ---");
                    while (rs.next()) {
                        // Adjust index or use column names like rs.getInt("id"), rs.getString("name")
                        System.out.print("ID: " + rs.getInt(1));
                        System.out.print(" | Name: " + rs.getString(2));
                        System.out.println(" | Department: " + rs.getString(3));
                    }
                }
            }

        } catch (ClassNotFoundException e) {
            System.err.println("MySQL JDBC Driver not found. Ensure the connector JAR is in your classpath.");
            e.printStackTrace();
        } catch (SQLException e) {
            System.err.println("Database error occurred!");
            e.printStackTrace();
        }
    }
}