<%-- 
    Document   : Preview
    Created on : Nov 4, 2019, 10:58:46 AM
    Author     : helpdesk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Preview</title>
    </head>
    <body bgcolor="#5c8a8a">
        
        <img src="C:\Users\Nur\Desktop\itblLogo.jpg" width="350" height="130" alt="Logo" align="middle"/>
        
        <br>
        <br>
        <br>
        <br>
        
    <center>

        <a href="index.jsp"><input onclick="this.parentNode.href=null;" type="button" value="Home" name="Home"/></a>
        <h1>Successful......!!</h1>
          
        <% 
            
            String emp_id = session.getAttribute("id").toString();
            String leave_type = request.getParameter("leave-type");
            String from = request.getParameter("from");
            String to = request.getParameter("to");
            String no_of_days = request.getParameter("total");
            String responsible = request.getParameter("reliever");
            String comment = request.getParameter("comment");
            
            

            Connection conn=null;
            Statement st=null;
            
            
            
            try
            {
                Class.forName("com.mysql.jdbc.Driver");
                conn=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/leave_management","root","");
                ResultSet rs=null;
                st=conn.createStatement();
                
                String qry1 = "select leave_type.days, leave_type.type, sum(leave_details1.total_day) as Taken from `leave_details1` inner join leave_type on leave_details1.leave_id=leave_type.leave_id where emp_id = '"+session.getAttribute("id")+"' and leave_details1.leave_id='"+leave_type+"'";               
                rs = st.executeQuery(qry1);
                 
             
                while(rs.next())
                {
                    
                    int reserve_days = Integer.parseInt(rs.getString(1));
                    int rem = (reserve_days-(Integer.parseInt(rs.getString(3))));
                    
                    if(reserve_days<Integer.parseInt(no_of_days) || rem<Integer.parseInt(no_of_days))
                    {
                        conn.close();
                        
                        response.sendRedirect("demoApplicationForm.jsp");
                    }
                   
                }
                
            }catch(Exception ex){
            
                out.print(ex.getMessage());
            }
            
            
           
            
            try
            {
                Class.forName("com.mysql.jdbc.Driver");
                conn=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/leave_management","root","");
                st=conn.createStatement();
                
               
            
                
                String qry2="INSERT INTO `leave_request` (`emp_id`, `from_date`, `to_date`, `leave_id`, `total_day`, `reliever`, `comment`) VALUES ('"+emp_id+"', '"+from+"', '"+to+"', '"+leave_type+"', '"+no_of_days+"', '"+responsible+"', '"+comment+"');";
                    
                st.executeUpdate(qry2);
                
                
                
            }catch(Exception ex){
            
                out.print(ex.getMessage());
            }
            
            conn.close();
            %>
            
           
                
        
        <br>
        <br>
        
        
        <table border="0" cellpadding="5">
            
            
            
            <tbody>
                
                <tr>
                    <td>Employee ID : </td>
                    <td><%= session.getAttribute("id")%></td>
                </tr>
                <tr>
                    <td>Leave Type : </td>
                    <td><%= leave_type%></td>
                </tr>
                <tr>
                    <td>From : </td>
                    <td><%= from%></td>
                </tr>
                <tr>
                    <td>To : </td>
                    <td><%= to%></td>
                </tr>
                <tr>
                    <td>Total Day : </td>
                    <td><%= no_of_days%></td>
                </tr>
                 <tr>
                    <td>Responsible Person : </td>
                    <td><%= responsible%></td>
                </tr>
                
                <tr>
                    <td>Comment : </td>
                    <td><%= comment%></td>
                </tr>
            </tbody>
        </table>
                
        <br>
        <br>
        <br>
        <br>
        

    </center>
        
    </body>
</html>
