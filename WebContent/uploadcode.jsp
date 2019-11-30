<%@ page import ="java.sql.*" %>
<%@ page import ="java.util.Date" %>
<%@ page import ="java.text.SimpleDateFormat" %>
  

<%
	//Date date1=new SimpleDateFormat("dd-mm-yyyy").parse(request.getParameter("date"));  
    //Date date1= new SimpleDateFormat("01-10-1999");
	String lang = request.getParameter("lang");
    String description = request.getParameter("description");
    String code = request.getParameter("subject");
  	int userid = Integer.parseInt(request.getSession().getAttribute("userid").toString());
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/users",
            "root", "");
    Statement st = con.createStatement();
    int i = st.executeUpdate("insert into code( date, lang, description, code, userid) values (' 2019-10-23 ','" + lang + "','" + description + "','" + code + "','" + userid + "' )");
	response.sendRedirect("homepage.jsp");
%>