package insertion;

import java.io.IOException; 
import java.io.PrintWriter; 
import java.sql.Connection; 
import java.sql.PreparedStatement; 
import java.sql.Statement;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.ServletException; 
import javax.servlet.annotation.WebServlet; 
import javax.servlet.http.HttpServlet; 
import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpServletResponse; 
import static java.lang.System.out;

@SuppressWarnings("unused")
@WebServlet("/insert")
public class insert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String uname= request.getSession().getAttribute("currentUser").toString(); 
		int prod=Integer.valueOf(request.getParameter("buynow"));
		int price=Integer.valueOf(request.getParameter("sessprice"));
			
		try
		{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/users", "root", "root");
		Statement st=conn.createStatement();

		int i=st.executeUpdate("insert into prods(uname,prod,price)values('"+uname+"','"+prod+"','"+price+"')");
		out.println("Data is successfully inserted!");
		}		catch (Exception e) { 
			e.printStackTrace(); 
		} 

	}

}

