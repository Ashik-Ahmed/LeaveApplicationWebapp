<%-- 
    Document   : PendingRequests
    Created on : Feb 11, 2020, 3:36:39 PM
    Author     : helpdesk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="style.css">
        <title>Pending Requests</title>
    </head>
    <body>
        
         <ul>
                    <li><a href="index.jsp"><%= session.getAttribute("name")%></a></li>
                    <li><a href="#" class="active">Pending Requests</a></li>
                    <li><a href="EquipmentList.jsp">Equipment Management</a></li>
                    <li><a href="CheckStatus.jsp">Check Status</a></li>
		    <li><a href="demoApplicationForm.jsp">Apply</a></li>
                    <li><a href="dashboard.jsp">Home</a></li> 
            
        </ul>
        
        
        
        
        <%
            
            Connection conn=null;
            Statement st=null;
            ResultSet rs=null;
            Statement st2=null;
            
            try{
                
                Class.forName("com.mysql.jdbc.Driver");
                conn=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/leave_management","root","");
                st=conn.createStatement();
                
                //String qry1 = "select emp_id, from_date, to_date, leave_id, total_day, reliever from `leave_request`";
                
                String qry1 = "select leave_request.from_date, leave_request.to_date, leave_request.total_day, leave_request.reliever, emp_info.name, leave_type.type from `leave_request` inner join emp_info on leave_request.emp_id = emp_info.id inner join leave_type on leave_request.leave_id = leave_type.leave_id";
                rs = st.executeQuery(qry1);
                
                if(rs.next())
                {
               
                
                    %>
                    
                        <h1>Pending Resuests</h1>
                        
                        <table class="content-table">
                
                <thead>
                    <tr> <th>Name</th> <th>Type</th> <th>Total Days</th> <th>From</th> <th>To</th> <th>Reliever</th> <th align="center">Action</th></tr>
                       
                </thead>
                    <tr bgcolor="#dddddd" style="border-bottom: 1px solid #ffffff;">   
                        
                            <td><%= rs.getString(5)%></td> 
                            <td><%= rs.getString(6)%></td> 
                            <td><%= rs.getString(3)%></td> 
                            <td><%= rs.getString(1)%></td> 
                            <td><%= rs.getString(2)%></td> 
                            <td><%= rs.getString(4)%></td>  
                            
                        <td bgcolor="#ffffff"> <div>
                
                                <a href='ActionOnLeaveRequest.jsp?id=<%= rs.getString(1)%>&action=approve' name="Approve" style="font-size: medium; text-decoration:none; background-color: rgb(0, 100, 0); color:white;; padding:10px; border: none; border-radius: 5px 5px 5px 5px;">Approve</a>
                                
                                <a href='ActionOnLeaveRequest.jsp?id=<%= rs.getString(1)%>&action=reject' name="Reject" style="font-size: medium; text-decoration:none; background-color: rgb(200, 0, 0); color:white; padding:10px; border: none; border-radius: 5px 5px 5px 5px;">Reject</a>
                
                            </div>  
                        </td>
                    </tr>
                 
                            
                <%         
                

                     
                }


                else
                    {
                %> <h1> No Pending Requests....</h1> <%
                        }
                
                
                
                
                
                while(rs.next())
                {
                    
                    
                    %>
                    
                    
                <tbody>
                    
                    <tr bgcolor="#dddddd" style="border-bottom: 1px solid #ffffff;">  
                        
                            <td><%= rs.getString(1)%></td> 
                            <td><%= rs.getString(2)%></td> 
                            <td><%= rs.getString(3)%></td> 
                            <td><%= rs.getString(4)%></td> 
                            <td><%= rs.getString(5)%></td> 
                            <td><%= rs.getString(6)%></td>  
                            
                        <td bgcolor="#ffffff"> <div>
                
                                <a href='ActionOnLeaveRequest.jsp?id=<%= rs.getString(1)%>&action=approve' name="Approve" style="font-size: medium; background-color: rgb(0, 100, 0); color:white;; padding:10px; border: none; border-radius: 5px 5px 5px 5px;">Approve</a>
                                
                                <a href='ActionOnLeaveRequest.jsp?id=<%= rs.getString(1)%>&action=reject' name="Reject" style="font-size: medium; background-color: rgb(200, 0, 0); color:white; padding:10px; border: none; border-radius: 5px 5px 5px 5px;">Reject</a>
                
                            </div>  
                        </td>
                    </tr>
               
                    <%
                }
                
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
