<%@ page import="java.sql.*" %>

<%

	String username=request.getParameter("username");
	String sq=request.getParameter("sq");
	String sa=request.getParameter("sa");
	
	try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:oci8:@localhost:1521:XE","hr","asdf");
            Statement st=con.createStatement();
			
			ResultSet rs=st.executeQuery("select * from cruduser where username='"+username+"'");
			rs.next();
			if((rs.getString("sq").equals(sq))&&(rs.getString("sa").equals(sa)))
			{
				session.setAttribute("usern",username);
				st.close();
				con.close();
			}
		}
	catch(Exception e)
		{
			out.println("error");
			out.println("<a href=forget-password.jsp>CLICK TO GO BACK</a>");	
		}

%>		

<form action=update-password.jsp>

<table>
	<tr>
		<td>ENTER PASSWORD</td>
		<td>:</td>
		<td><input type=password name=p1>
	</tr>
	<tr>
		<td>RE-ENTER PASSWORD</td>
		<td>:</td>
		<td><input type=password name=p2>
		
	</tr>
	<tr>
		<td><input type=submit value=CONFRIM></td>
		<td></td>
		<td><input type=reset value=RE-ENTER></td>
		
<table>

</form>
