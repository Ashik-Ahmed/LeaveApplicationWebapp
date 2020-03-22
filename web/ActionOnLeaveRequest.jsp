<%-- 
    Document   : ActionOnLeaveRequest
    Created on : Feb 23, 2020, 12:01:33 PM
    Author     : helpdesk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <%

            
            Connection conn=null;
            Statement st=null;
            ResultSet rs=null;
            
            String id = request.getParameter("id");
            int emp_id = Integer.parseInt(id);
            
            String action = request.getParameter("action");
            
            out.print(action);
           
            try{
                
                Class.forName("com.mysql.jdbc.Driver");
                conn=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/leave_management","root","");
                st=conn.createStatement();
                
                if(action.equals("approve"))
                {
                    String qry1 = "insert into `leave_details1` (emp_id, from_date, to_date, leave_id, total_day, reliever, applicationDate) select emp_id, from_date, to_date, leave_id, total_day, reliever, applicationDate from `leave_request` where emp_id='"+emp_id+"'";
                    st.executeUpdate(qry1);
                    String qry2 = "delete from `leave_request` where emp_id='"+emp_id+"'";
                    st.executeUpdate(qry2);
                    response.sendRedirect("PendingRequests.jsp");
                }
                
                else if(action.equals("reject"))
                {
                    String qry3 = "delete from `leave_request` where emp_id='"+emp_id+"'";
                    st.executeUpdate(qry3);
                    response.sendRedirect("PendingRequests.jsp");
                }
                
                
                }
            
            
            catch(Exception ex)
            {
                out.print(ex.getMessage());
            }

            %>
            
        
    </body>
</html>
