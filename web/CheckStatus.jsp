<%-- 
    Document   : CheckStatus
    Created on : Feb 3, 2020, 8:25:13 PM
    Author     : helpdesk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="style.css">
        <title>Check Status</title>
        
        <style type="text/css">
            
            .searchbox
            {
                position: fixed;
                top: 180px;
                left: 50%;
                transform: translate(-50%, -50%);
            }
            
            input
            {
                position: relative;
                display: inline-block;
                font-size: 20px;
                box-sizing: border-box;
                transition: .5s;
               
            }
            
            input[type="text"]
            {
                background: #999;
                width: 340px;
                height: 50px;
                border: none;
                outline: none;
                padding: 0 25px;
                border-radius: 25px 0 0 25px;
            }
            
            input[type="submit"]
            {
                position: relative;
                background: #ffc107;
                left: -5px;
                color: #fff;
                width: 150px;
                height: 50px;
                border: none;
                outline: none;
                cursor: pointer;
                border-radius: 0 25px 25px 0;
            }
            
             input[type="submit"]:hover
            {
                
                background: #ff5722;
                
            }
            
            .outerbox
            {
                background: #fff;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.30);
                padding: 5px 5px;
            }
    	
        </style>
        
    </head>
    <body>
        <ul>
                    <li><a href="index.jsp"><%= session.getAttribute("name")%></a></li>
                    <li><a href="PendingRequests.jsp">Pending Requests</a></li>
                    <li><a href="EquipmentList.jsp">Equipment Management</a></li>
                    <li><a href="#" class="active">Check Status</a></li>
		    <li><a href="demoApplicationForm.jsp">Apply</a></li>
                    <li><a href="dashboard.jsp">Home</a></li> 
            
        </ul>
        <h1>Leave Status Check</h1>
        
        <div class="searchbox">
            <form method="POST">
                <input type="text" name="empId" placeholder="Employee ID...">
                <input type="submit" name="submit" value="Search">
            </form>
        </div>
        
        <%
            String empId = request.getParameter("empId");
            boolean table_header=false;
                    
            Connection conn=null;
            Statement st=null;
            ResultSet rs=null;
            //PreparedStatement preparedStatement = null;
            
             try
            {
                Class.forName("com.mysql.jdbc.Driver");
                conn=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/leave_management","root","");
                st=conn.createStatement();
                
                String qry1 = "select name, designation, mobile from `emp_info` where id='"+empId+"'";
                rs = st.executeQuery(qry1);
                
                while(rs.next())
                {
                
                %>
                <br>
                <br>
                <br>
                <br>
                
                    
            <table class="employee-table">
                
                <thead>
                    <tr> <th align="center" colspan="2"> Employee Details</th></tr>
                </thead>
            
                <tr><td>Name : </td> <td><%= rs.getString(1)%></td></tr>
                <tr><td>Designation : </td> <td><%= rs.getString(2)%></td></tr>
                <tr><td>Mobile : </td> <td><%= rs.getString(3)%></td></tr>
            </table>
            
               
                
               <%
                    
                   table_header = true;
                    }


/*
                String qry2 = "select leave_type.type, sum(leave_details1.total_day) as Taken from `leave_details1` inner join leave_type on leave_details1.leave_id=leave_type.leave_id where emp_id = '"+empId+"' group by leave_details1.leave_id";               
                rs = st.executeQuery(qry2);
*/
                String qry2 = "select leave_type.days, leave_type.type, sum(leave_details1.total_day) as Taken from `leave_details1` inner join leave_type on leave_details1.leave_id=leave_type.leave_id where emp_id = '"+empId+"' group by leave_details1.leave_id";               
                rs = st.executeQuery(qry2);
               
               
               if(table_header)
                        {
               
                            %>
                            
                <br>
                <br>
                <br>
                <br>
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

                  
            }


            %>
            
             </tbody>
    
             </table>
        
          <div style="background-color: #ff5722; margin-left: 50%; margin-top: 10%; margin-right: 5%">
    
        <p>This is a new Div. This is a new Div. This is a new Div. This is a new Div. This is a new Div. 
            This is a new Div. This is a new Div. This is a new Div. This is a new Div. This is a new Div. 
            This is a new Div. This is a new Div. This is a new Div. This is a new Div. This is a new Div. 
            This is a new Div. This is a new Div. This is a new Div. This is a new Div. This is a new Div. 
            This is a new Div. This is a new Div. This is a new Div. This is a new Div. This is a new Div. 
            This is a new Div. This is a new Div. This is a new Div. This is a new Div. This is a new Div. 
            This is a new Div. This is a new Div. This is a new Div. This is a new Div. This is a new Div. 
            This is a new Div. This is a new Div. This is a new Div. This is a new Div. This is a new Div.
            This is a new Div. This is a new Div. This is a new Div. This is a new Div. This is a new Div.
            This is a new Div. This is a new Div. This is a new Div. This is a new Div. This is a new Div. 
            This is a new Div. This is a new Div. This is a new Div. This is a new Div. This is a new Div. 
            This is a new Div. This is a new Div. This is a new Div. This is a new Div. This is a new Div. 
            This is a new Div. This is a new Div. This is a new Div. This is a new Div. This is a new Div. 
            This is a new Div. This is a new Div. This is a new Div. This is a new Div. This is a new Div. 
            This is a new Div. This is a new Div. This is a new Div. This is a new Div. This is a new Div. 
            This is a new Div. This is a new Div. This is a new Div. This is a new Div. This is a new Div. 
            This is a new Div. This is a new Div. This is a new Div. This is a new Div. This is a new Div.
            This is a new Div. This is a new Div. This is a new Div. This is a new Div. This is a new Div.</p>
        
    </div>
            
            
            <%

            
              
            } catch(Exception ex)
            {
                out.print(ex.getMessage());
            }

              
                  conn.close();
                
            %>
            
   
 
</html>
