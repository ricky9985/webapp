<%@ page import="java.sql.*" %>

<%
	String username=request.getParameter("d");
	try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:oci8:@localhost:1521:XE","hr","asdf");
            Statement st=con.createStatement();
			
			st.executeQuery("delete from cruduser where username='"+username+"'");
			String ip=request.getRemoteAddr();
			st.executeQuery("insert into logger values('"+ip+"','deleted_user='"+username+"', current_timestamp)");
			
			response.sendRedirect("home.jsp");
			st.close();
			con.close();
		}
	catch(Exception e)
		{
			out.println("no user");
			out.println("<a href=home.jsp>CLICK TO GO BACK</a>");	
		}
%>
			
			
