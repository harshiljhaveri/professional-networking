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


@WebServlet("/deleteData1")
public class deleteData1 extends HttpServlet {
private static final long serialVersionUID = 1L;


public deleteData1() {
    super();
    // TODO Auto-generated constructor stub
}

protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    response.setContentType("text/html");
    PrintWriter out = response.getWriter();

    Connection conn = null;
    int id = Integer.parseInt(request.getParameter("id"));
    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test?user=root&password=Tpg@1234");
        Statement stmt = conn.createStatement();
        String sql ="select * from prods where uname='"+id+"' ";
		//resultSet = stmt.executeQuery(sql);
		int count=1;
		//while(resultSet.next()){
		
//        int j=stmt.executeUpdate("INSERT INTO prods(uname,prod,price)values('"+uname+"','"+prod+"','"+price+"')");

        String query = "delete from login where id="+id;
        int i = stmt.executeUpdate(query);
        if(i>0){
            response.sendRedirect("http://localhost:8080/First/Display");
        }
        conn.close();
    }
    catch(Exception e){
        e.printStackTrace();
    }
}


protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    // TODO Auto-generated method stub
}
}