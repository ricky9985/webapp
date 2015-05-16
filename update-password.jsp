<%@ page import="java.sql.*" %>

<%
	String password1=request.getParameter("p1");
	String password2=request.getParameter("p2");
	String username=session.getAttribute("usern").toString();
	
	if(password1.equals(password2))
	{
		
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:oci8:@localhost:1521:XE","hr","asdf");
            Statement st=con.createStatement();
			
			st.executeQuery("update cruduser set password='"+password1+"'where username='"+username +"'");
			String ip=request.getRemoteAddr();
			st.executeQuery("insert into logger values('"+ip+"','password_updated', current_timestamp)");
			st.close();
			con.close();
			response.sendRedirect("index.jsp");
			
		}
		catch(Exception e)
		{
			out.println("error");
		}
	}
	else
	{
		out.println("Password does not match");
		out.println("<a href=forget-password.jsp>CLICK TO GO BACK</a>");
	}
%>
