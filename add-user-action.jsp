<%@ page import="java.sql.*" %>

<%
	String username=request.getParameter("username");
	String password=request.getParameter("password");
	String firstname=request.getParameter("firstname");
	String lastname=request.getParameter("lastname");
	String mailid=request.getParameter("mailid");
	String contact=request.getParameter("contact");
	String sq=request.getParameter("sq");
	String sa=request.getParameter("sa");

	try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:oci8:@localhost:1521:XE","hr","asdf");
            Statement st=con.createStatement();
			
			st.executeQuery("insert into cruduser values('"+username+"','"+password+"','"+firstname+"','"+lastname+"','"+mailid+"','"+contact+"','"+sq+"','"+sa+"')");
			
			String ip=request.getRemoteAddr();
			st.executeQuery("insert into logger values('"+ip+"','user_added', current_timestamp)");
			
			st.close();
			con.close();
			
			response.sendRedirect("index.jsp");
		}
	catch(Exception e)
		{
			out.println("error");
		}


%>
