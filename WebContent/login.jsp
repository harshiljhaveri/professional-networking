<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" %>
<%
    String uname = request.getParameter("uname");    
    String pwd = request.getParameter("pass");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/users",
            "root", "");
    int userid;
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from user where uname='" + uname + "' and pass='" + pwd + "'");
    if (rs.next()) {
    	userid=Integer.parseInt(rs.getString("userid"));
        session.setAttribute("uname", uname);
        session.setAttribute("userid", userid);
        response.sendRedirect("homepage.jsp");
    } else {
        out.println("Invalid password <a href='index.jsp'>Try Again</a>");
    }
%>