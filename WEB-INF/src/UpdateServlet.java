/* write a servlet application to delete the specified department from dept table*/
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
public class UpdateServlet extends HttpServlet
{
Connection con=null;
public void init(ServletConfig sc)throws ServletException
{
	try
	{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/XE","system","tiger");
	}
	catch(Exception e)
	{
	e.printStackTrace();
	}
}
public void doGet(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
{
res.setContentType("text/html");
PrintWriter pw=res.getWriter();
//int n=Integer.parseInt(req.getParameter("dno"));
String name=req.getParameter("name");

String pass=req.getParameter("pass");
	try
	{
	PreparedStatement ps=con.prepareStatement("update userreg set pass= ? where name = ?");
	ps.setString(1,pass);
	ps.setString(2,name);
	int count=ps.executeUpdate();
	if (count>0)
	pw.println("row updated successfully");
	else
	pw.println("row not updated");
	con.close();
	}
	catch(Exception e)
	{
	e.printStackTrace();
	}
}
}