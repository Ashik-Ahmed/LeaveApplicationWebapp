<%-- 
    Document   : dashboard
    Created on : Jan 27, 2020, 8:07:41 PM
    Author     : helpdesk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="style.css">
        <title>Dashboard</title>
        
        
        
    </head>
    <body>
        
        <%
           
        
            Connection conn=null;
            Statement st=null;
            ResultSet rs=null;
            //PreparedStatement preparedStatement = null;
            
             try
            {
                Class.forName("com.mysql.jdbc.Driver");
                conn=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/leave_management","root","");
                st=conn.createStatement();
                
                String qry1 = "select action from `emp_info` where id='"+session.getAttribute("id").toString()+"'";
                rs = st.executeQuery(qry1);
                
                while(rs.next())
                {
        
                    if(rs.getString(1).equals("admin"))
                    {
                        %>
                        <ul>
                    <li><a href="Logout.jsp"><%= session.getAttribute("name")%></a></li>
                    <li><a href="PendingRequests.jsp">Pending Requests</a></li>
                    <li><a href="EquipmentList.jsp">Equipment Management</a></li>
                    <li><a href="CheckStatus.jsp">Check Status</a></li>
		    <li><a href="demoApplicationForm.jsp">Apply</a></li>
                    <li><a href="#" class="active">Home</a></li> 
            
                        </ul>
                        <%
                    }


                    else
                        {
                           %>
                            <ul>
                                <li><a href="Logout.jsp"><%= session.getAttribute("name")%></a></li>		    
                                <li><a href="demoApplicationForm.jsp">Apply</a></li>
                                <li><a href="#" class="active">Home</a></li> 
            
                            </ul>
                           <%
                            
                            }
        
                      
                            }

                            conn.close();
                
            }
             catch(Exception ex)
             {
                 out.print(ex.getMessage());
             }
             
                            
                            %>
        
        <h1>Dashboard</h1>
        
       
        <%
            
             try
            {
                Class.forName("com.mysql.jdbc.Driver");
                conn=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/leave_management","root","");
                st=conn.createStatement();
                
                String qry1 = "select id, name, designation, mobile from `emp_info` where id='"+session.getAttribute("id").toString()+"'";
                rs = st.executeQuery(qry1);
                
                while(rs.next())
                {
                
                %>
            <table class="employee-table">
                
                <thead>
                    <tr> <th align="center" colspan="2"> Employee Details</th></tr>
                </thead>
            
                <tr><td>ID : </td> <td><%= rs.getString(1)%></td></tr>
                <tr><td>Name : </td> <td><%= rs.getString(2)%></td></tr>
                <tr><td>Designation : </td> <td><%= rs.getString(3)%></td></tr>
                <tr><td>Mobile : </td> <td><%= rs.getString(4)%></td></tr>
            
            </table>
                <br>
                <br>
                <br>
                <br>
                
                
                <%
                    
                    }


                String qry2 = "select leave_type.days, leave_type.type, sum(leave_details1.total_day) as Taken from `leave_details1` inner join leave_type on leave_details1.leave_id=leave_type.leave_id where emp_id = '"+session.getAttribute("id")+"' group by leave_details1.leave_id";               
                rs = st.executeQuery(qry2);
                 
              %>
              
               <table class="content-table">
             
                   <thead>
            
                        <tr>
                            <th>Leave Type</th>
                            <th>Taken</th>
                            <th>Remaining</th>
                         </tr>
                   </thead>
            <%
                while(rs.next())
                {
                    
                    int rem = (Integer.parseInt(rs.getString(1)))-(Integer.parseInt(rs.getString(3)));
                   
                    %>
                    
             
          <tbody>       
            <tr>
        
                <td><%= rs.getString(2) %> </td>
                <td><%= rs.getString(3) %> </td>
                <td><%= rem %> </td>
             
            </tr>
        
        
        <%  
            
                    }

                  conn.close();
                
            }
             

            catch(Exception ex)
            {
                out.print(ex.getMessage());
            }

            
            %>
            
    </tbody>
    
    </table>
    
            
            
    </body>
</html>
