<%@ page import="java.sql.*" %>

<%
	
	try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:oci8:@localhost:1521:XE","hr","asdf");
            Statement st=con.createStatement();
			
			ResultSet rs=st.executeQuery("select * from cruduser");
		
			
			while(rs.next())
				{
					String username=rs.getString("username");
					
					out.println(username);
					out.println(" <a href=view.jsp?u="+username+">VIEW DETAIL</a>");
					//out.println(" <a href=edit-detail.jsp?e="+username+">EDIT DETAILS</a>");
					out.println(" <a href=delete-user.jsp?d="+username+">DELETE USER</a><br><br>");
					
				}
			String ip=request.getRemoteAddr();
			st.executeQuery("insert into logger values('"+ip+"','viewed_all-users_details', current_timestamp)");
			
		
			st.close();
			con.close();
			
			
		}
	catch(Exception e)
		{
			
		}

%>
