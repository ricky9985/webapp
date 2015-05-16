<%@ page import="java.sql.*" %>

<%
	String username=session.getAttribute("uname").toString();
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
					String mailid=rs.getString("mailid");
					String contact=rs.getString("contact");
					
					out.println(firstname+"<br><br>");
					out.println(lastname+"<br><br>");
					out.println(mailid+"<br><br>");
					out.println(contact+"<br><br>");
				}
				
			String ip=request.getRemoteAddr();
			st.executeQuery("insert into logger values('"+ip+"','viewed_details', current_timestamp)");
		
			st.close();
			con.close();
			
			
		}
	catch(Exception e)
		{
			
		}

%>
