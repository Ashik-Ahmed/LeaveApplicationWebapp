<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
  <%
    String id = request.getParameter("id");
    String password = request.getParameter("password");
    String Name = "Empty";
    
    
    
    Connection conn=null;
    Statement st=null;
    ResultSet rs=null;
   
    
    try
            {
                Class.forName("com.mysql.jdbc.Driver");
                conn=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/leave_management","root","");
                st=conn.createStatement();
                
                String qry = "select id, name, pass, action from `emp_info` where id='"+id+"' and pass='"+password+"'";
                
                
                rs = st.executeQuery(qry);
                
               
                if(rs.next())
                {
                    
                    if(rs.getString("action").equals("admin"))
                    {
                        
                        session.setAttribute("id",id);
                        session.setAttribute("name",rs.getString("name"));
                        conn.close();
                        response.sendRedirect("dashboard.jsp");
                    }
                    
                    else
                    {
                        session.setAttribute("id",id);
                        session.setAttribute("name",rs.getString("name"));
                        conn.close();
                        response.sendRedirect("dashboard.jsp");
                    }
                    
                }
                else
                {
                    response.sendRedirect("Error.html");
                }
                
                
                
            }
    
    catch(Exception ex)
    {
        out.print(ex.getMessage());
    }
    
    
    
    
    /*
    
    
    if((id.equals("25")&&password.equals("1234"))||(id.equals("22")&&password.equals("1234")))
    {
        response.sendRedirect("dashboard.jsp");
    }
    else
    {
        response.sendRedirect("Error.html");
    }
    
    */
    
    /*
    if((username.equals("admin")&&password.equals("admin")))
    {
    	response.sendRedirect("dashboard.jsp");
    }else
    {
    	response.sendRedirect("Error.html");
    }

    */
  %>

</body>
</html>