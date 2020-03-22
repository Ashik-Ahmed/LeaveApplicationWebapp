<%-- 
    Document   : EquipmentList
    Created on : Mar 7, 2020, 5:14:40 PM
    Author     : helpdesk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="style.css">
        <link href="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet"/>

        <title>Equipment</title>
        
        
        
        <style>
            
        table {
            
            margin-left: 200px;
            width: 70%;
        }

        thead, tbody, tr, td, th { display: block; }

        tr:after {
            content: ' ';
            display: block;
            visibility: hidden;
            clear: both;
        }
        
        tr:hover{
            background-color: lightgray;
        }

        thead th {
            height: 40px;

            /*text-align: left;*/
        }

        tbody {
            height: 700px;
            width: 1000px;
            overflow-y: auto;
            border: 1px solid lightgray;
        }

        thead {
            
            width: 1000px;
            /* fallback */
        }


        tbody td, thead th {
            width: 19.2%;
            float: left;
        }

    </style>
        
    </head>
    <body>
        
        
        <ul>
                    <li><a href="Logout.jsp"><%= session.getAttribute("name")%></a></li>
                    <li><a href="PendingRequests.jsp">Pending Requests</a></li>
                    <li><a href="#">Equipment Management</a></li>
                    <li><a href="CheckStatus.jsp">Check Status</a></li>
		    <li><a href="demoApplicationForm.jsp">Apply</a></li>
                    <li><a href="dashboard.jsp" class="active">Home</a></li> 
            
        </ul>
                    
                    
        
        
        <div align="center" style="margin-top: 100px;">
            <label>
                Search: 
                <input type="search" placeholder="" style="border-radius: 3px 3px 3px 3px">
            </label>
        </div>
            
        <table class="table">
    <thead>
        <tr style="background-color: #4CAF50">
            <th>Name</th>
            <th>Details</th>
            <th>Quantity</th>
            <th>Stock</th>
        </tr>
    </thead>
   <tbody>
       <%
             try
            {
                
                Connection conn=null;
                Statement st=null;
                ResultSet rs=null;
            
            
                Class.forName("com.mysql.jdbc.Driver");
                conn=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/leave_management","root","");
                st=conn.createStatement();
                
                String qry2 = "select * from `equipment_management`";
                rs = st.executeQuery(qry2);
                
                while(rs.next())
                {
                    %>
                    
                    
                        <tr>
                                <td><%= rs.getString("name")%></td>
                                <td><%= rs.getString("details")%></td>
                                <td><%= rs.getString("quantity")%></td>
                                <td><%= rs.getString("stock")%></td>
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
