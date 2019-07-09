<%@page import="org.montecuollo.utils.DbUtils"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.montecuollo.utils.DbUtils"%>
<%


String driver = "org.mariadb.jdbc.Driver";
String connectionUrl = "jdbc:mariadb://ferdymariadb.mariadb.database.azure.com:3306/";
String database =  "${env.MARIADB_DATABASE}"; //"DOCKERWEBAPP";
String userid = "${env.MARIADB_USER}";//"fernando@ferdymariadb";
String password = "${env.MARIADB_PASSWORD}";//"Sorgesan@";


Connection connection = null; 
Statement statement = null;
ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Hello</title>
</head>
<body>
<p>Hello, docker application user</p>
<p></p>
<p></p>
<p><i>This web application was deployed to AKS by a CI/CD process</i></p>
<p></p>
<h1>Data from an Azure database for MariaDB</h1>
<table border="1">
<tr>
<td><b>cognome</b></td>
<td><b>nome</b></td>
<td><b>sesso</b></td>
</tr>
<%
try{
connection= DbUtils.getDataSourceConnection("DOCKERWEBAPP");
statement=connection.createStatement();
String sql ="select * from PERSONE";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("COGNOME") %></td>
<td><%=resultSet.getString("NOME") %></td>
<td><%=resultSet.getString("SESSO") %></td>
</tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</body>
</html>




