<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>special offer</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 8px;
            text-align: center;
        }
        body{
           background-image:url("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRlRj3NTVW07lZ8uhG0mTHz-FPxDs5mGuWEaQ&s");
           height:100vh;          
           width:auto;
           background-size:cover;
        }
    </style>
</head>
<body>
    <h2>Special Offers</h2>
    <%
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/res";
        String db_name = "root";
        String db_pwd = "khyathi9701";
        con = DriverManager.getConnection(url, db_name, db_pwd);
        ps = con.prepareStatement("SELECT * FROM desserts");
        rs = ps.executeQuery();
    %>
        <table>
            <thead>
                <tr>
                    <th>Items Name</th>
                    <th>Special prices</th>
                </tr>
            </thead>
            <tbody>
    <%
        while (rs.next()) {
    %>
                <tr>
                    <td><%= rs.getString(1) %></td>
                    <td><%= rs.getInt(2) %></td>
                </tr>
    <%
        }
    %>
            </tbody>
        </table>
    <%
    } 
    catch (Exception e) {
        out.println("<p>Error: " + e.getMessage() + "</p>");
    }
    %>
    <a href="Menu.html">Back to menu</a><br>
    <a href="home.html">Back to home</a>
</body>
</html>