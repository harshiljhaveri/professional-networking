<%@ page import ="java.sql.*" %>
<%@ page import ="java.util.Date" %>
<%@ page import ="java.text.SimpleDateFormat" %>
  

<%
	String title = request.getParameter("title");
	String topic = request.getParameter("topic");
    String post = request.getParameter("post");
  	int userid = Integer.parseInt(request.getSession().getAttribute("userid").toString());
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/users",
            "root", "");

    Statement st = con.createStatement();
    int i = st.executeUpdate("insert into userpost( userid, topic, title, post) values ('" + userid + "','" + topic + "','" + title + "', '" + post + "')");
	response.sendRedirect("index.jsp");
%>