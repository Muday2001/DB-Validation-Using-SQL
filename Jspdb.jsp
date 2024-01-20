
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
            ps1 = con.prepareStatement("select count(*) from userreg where name = ? and pass=?");
            ps2 = con.prepareStatement("select * from userreg");
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
    }
%>
<%
    String param = request.getParameter("s1");
    if(param =="link")
    {
        ResultSet rs = ps2.executeQuery();
        out.println("<table>");
        while(rs.next())
        {
            out.println("<tr>");
            out.println("<td>"+rs.getString(1)+"</td>");
            out.println("<td>"+rs.getString(2)+"</td>");
            out.println("</tr>");
        }
        out.println("</table>");
        rs.close();
    }
    else
    {
        
        String user = request.getParameter("name");
        String pass = request.getParameter("pass");
        
        ps1.setString(1,user);
        ps1.setString(2,pass);
        ResultSet rs = ps1.executeQuery();
        int cnt = 0;
        if (rs.next())
            cnt = rs.getInt(1);
        if(cnt == 0)
            out.println("<center><h2><font color=red>Invalid credential</font></h2></center>");
        else
        {
            out.println("<form><fieldset style= width:25%; >");
            out.println("<b><i><font color=red>valid credential..</font></i></b><br>");
            out.println("<b><i><font size=6 color=blue><Welcome to My Page</font></i></b>");
            out.println("</fieldset></form>");
			 String redirectURL = "msp.html";
              response.sendRedirect(redirectURL);
        }
    }
%>
<%!
    public void jspDestroy()
    {
        try
        {
            //colse
            ps1.close();
            ps2.close();
            con.close();
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
    }
%>