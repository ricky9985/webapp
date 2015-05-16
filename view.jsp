<%@ page import="java.sql.*" %>

<%
	String username=request.getParameter("u");
	try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:oci8:@localhost:1521:XE","hr","asdf");
            Statement st=con.createStatement();
			
			ResultSet rs=st.executeQuery("select * from cruduser where username='"+username+"'");
		
			
			while(rs.next())
				{
					String firstname=rs.getString("firstname");
					String lastname=rs.getString("lastname");
					String contact=rs.getString("contact");
					String mailid=rs.getString("mailid");
					
					out.println("<input type=text name=t1 value="+firstname+"><br><br>");
					out.println(lastname+"<br><br>");
					out.println(contact+"<br><br>");
					out.println(mailid+"<br><br>");
					
				}
			String ip=request.getRemoteAddr();
			st.executeQuery("insert into logger values('"+ip+"','viewed_details_of_user='"+username+"', current_timestamp)");
			
		
			st.close();
			con.close();
			
			
		}
	catch(Exception e)
		{
			
		}

%>
