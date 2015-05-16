<%@ page import="java.sql.*" %>


<%

	String username=request.getParameter("username");
	String password=request.getParameter("password");	

	try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:oci8:@localhost:1521:XE","hr","asdf");
            Statement st=con.createStatement();
			
			ResultSet rs=st.executeQuery("select * from cruduser");
			
			int flag=0;
			
			while(rs.next())
				{
					String dbusername=rs.getString("username");
					String dbpassword=rs.getString("password");
					
					if((username.equals(dbusername))&&(password.equals(dbpassword)))
						{
							flag=1;
							break;
						}
				}
				
				
				if(flag==1)
					{
						session.setAttribute("uname",username);
						String ip=request.getRemoteAddr();
						st.executeQuery("insert into logger values('"+ip+"','login', current_timestamp)");
						response.sendRedirect("home.jsp");
					}
				else
					{
						response.sendRedirect("index.jsp");
					}
			
			
			
			
			st.close();
			con.close();
			
			
		}
	catch(Exception e)
		{
			
		}


%>
