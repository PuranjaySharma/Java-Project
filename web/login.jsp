<%-- 
    Document   : login
    Created on : 26 Nov, 2018, 10:50:25 PM
    Author     : PURU
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%
            String email =request.getParameter("email");
           String pwd=request.getParameter("Password");
           try
           {
	
               String myUrl="jdbc:mysql://localhost/voting system";
		//step 1:
		Class.forName("com.mysql.jdbc.Driver");
      		//step 2:
		Connection conn=DriverManager.getConnection(myUrl,"root","");
                String query="Select Email,Password from signup where Email= '"+email+"' and Password='"+pwd+"'";
		//step 3:
		Statement st=conn.createStatement();
		//step 4:
		ResultSet rs =st.executeQuery(query);
		if(rs.next()){
			String redirectURL = "home.html";
                        response.sendRedirect(redirectURL);

		}  
                else
                {
                    String a = "Invalid.html";
                    response.sendRedirect(a);
                }
		//step 5
		st.close();
		}
		catch(Exception e){
			System.out.println("Got an exception! ");
			System.out.println(e.getMessage());
		}
           
        %>
    </body>
</html>
