
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%!
    Connection con;
    PreparedStatement ps1, ps2;
    public void jspInit()
    {
        try
        {
            
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/XE", "system", "tiger");
            ps1 = con.prepareStatement("update userreg set pass= ? where name= ?");
            //ps2 = con.prepareStatement("select * from userreg");
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
    }
%>
<%
 
       
        String pass = request.getParameter("pass");
		String user = request.getParameter("name");
        ps1.setString(1,pass);
        ps1.setString(2,user);
		//int cnt=0;
		int cnt=ps1.executeUpdate();
		//int cnt=ps1.executeQuerry();
		//ps1.close();
		con.close();
	     
		if(cnt>0)
		   {
			   out.println("<center><font color=blue><h3> User passWord modification Successfull</h3></font></center>");
		       //out.println("<center><img src=http://192.168.43.42:8181/uservaljsp/jsplog/lp/images/arch3.jpg width=600 height=250></img></center>");
     		  out.println("<center><img src=http://192.168.43.42:8181/uservaljsp/jsplog/lp/images/welcome.jpg width=600 height=250></img></center>");
				out.println("<center><h2><font color=green>Wel Come to SKA Developments</font></h2></center>");
				out.println("<center><h2><font color=orange>This Site Is Developed By SKA Developments</font></h2></center>");
		   }
		   else
		   {
              out.println("<center><font color=blue><h3>User modification not Successfull</h3></font></center>");
			   
		   }
       
%>
<%!
    public void jspDestroy()
    {
        try
        {
            //colse
            ps1.close();
           // ps2.close();
            con.close();
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
    }
%>