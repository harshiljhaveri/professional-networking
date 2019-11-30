<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%

try
{
Class.forName("com.mysql.jdbc.Driver");
//Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "Hotmail123");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/users", "root", "root");

Statement st=conn.createStatement();

String uname= request.getSession().getAttribute("uname").toString(); 
String prod=request.getSession().getAttribute("prod").toString();
int price=Integer.parseInt(request.getSession().getAttribute("sessprice").toString());

int i=st.executeUpdate("INSERT INTO cart(uname,prod,price)values('"+uname+"','"+prod+"','"+price+"')");
out.println("Data is successfully inserted!");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
	response.sendRedirect("cart.jsp"); 
%>
