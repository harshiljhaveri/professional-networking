<%@ page import ="java.sql.*" %>
<%
    String user = request.getParameter("uname");    
    String pwd = request.getParameter("pass");
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    long contact = Long.parseLong(request.getParameter("contact"));
  	    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/users",
            "root", "");

    Statement st = con.createStatement();
    //ResultSet rs;
    int i = st.executeUpdate("insert into user( uname, pass, name, email, contact) values ('" + user + "','" + pwd + "','" + name + "','" + email + "','" + contact + "' )");
	response.sendRedirect("index.jsp");
%>