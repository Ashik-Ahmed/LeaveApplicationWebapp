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
            String leave_id = request.getParameter("leave-type");
            String from = request.getParameter("from");
            String to = request.getParameter("to");
            String no_of_days = request.getParameter("total_day");
            String responsible = request.getParameter("responsible_person");
            

            Connection conn=null;
            Statement st=null;
            
            try
            {
                Class.forName("com.mysql.jdbc.Driver");
                conn=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/leave_management","root","");
                st=conn.createStatement();
            
                
                /*
                String qry="INSERT INTO `leave_details1` (`emp_id`, `from_date`, `to_date`, `leave_id`, `total_day`, `reliever`) VALUES ('"+emp_id+"', '"+from+"', '"+to+"', '"+leave_id+"', '"+no_of_days+"', '"+responsible+"');";
                    
                st.executeUpdate(qry);
                */
                
                String qry="INSERT INTO `leave_request` (`emp_id`, `from_date`, `to_date`, `leave_id`, `total_day`, `reliever`) VALUES ('"+emp_id+"', '"+from+"', '"+to+"', '"+leave_id+"', '"+no_of_days+"', '"+responsible+"');";
                    
                st.executeUpdate(qry);
                
                /*
                if("1".equals(request.getParameter("leave-type")))
                {
                    //String qry="INSERT INTO `leave_details` (`id`, `name`, `designation`, `mobile`, `from_date`, `to_date`, `leave_id`, `no_of_day`, `responsible_person`) VALUES ('"+emp_id+"', 'Kabir Hossain', 'Junior Engineer', '+8801999097206', '"+from+"', '"+to+"', '"+type+"', '"+day_total+"', '"+responsible+"');";
                    String qry="INSERT INTO `leave_details1` (`emp_id`, `from_date`, `to_date`, `leave_id`, `total_day`, `reliever`) VALUES ('"+emp_id+"', '"+from+"', '"+to+"', '"+leave_id+"', '"+no_of_days+"', '"+responsible+"');";
                    
                    st.executeUpdate(qry);
               
                }
                
                else if("2".equals(request.getParameter("leave-type")))
                {
                    String qry="INSERT INTO `leave_details1` (`emp_id`, `from_date`, `to_date`, `leave_id`, `total_day`, `reliever`) VALUES ('"+emp_id+"', '"+from+"', '"+to+"', '"+leave_id+"', '"+no_of_days+"', '"+responsible+"');";
                    
                    st.executeUpdate(qry);
               
                }
                
                 else if("3".equals(request.getParameter("leave-type")))
                {
                    String qry="INSERT INTO `leave_details1` (`emp_id`, `from_date`, `to_date`, `leave_id`, `total_day`, `reliever`) VALUES ('"+emp_id+"', '"+from+"', '"+to+"', '"+leave_id+"', '"+no_of_days+"', '"+responsible+"');";
                    
                    st.executeUpdate(qry);
               
                }
                 
                  else if("4".equals(request.getParameter("leave-type")))
                {
                    String qry="INSERT INTO `leave_details1` (`emp_id`, `from_date`, `to_date`, `leave_id`, `total_day`, `reliever`) VALUES ('"+emp_id+"', '"+from+"', '"+to+"', '"+leave_id+"', '"+no_of_days+"', '"+responsible+"');";
                    
                    st.executeUpdate(qry);
               
                }
                  
                   else if("5".equals(request.getParameter("leave-type")))
                {
                    String qry="INSERT INTO `leave_details1` (`emp_id`, `from_date`, `to_date`, `leave_id`, `total_day`, `reliever`) VALUES ('"+emp_id+"', '"+from+"', '"+to+"', '"+leave_id+"', '"+no_of_days+"', '"+responsible+"');";
                    
                    st.executeUpdate(qry);
               
                }
                   
                    else if("6".equals(request.getParameter("leave-type")))
                {
                    String qry="INSERT INTO `leave_details1` (`emp_id`, `from_date`, `to_date`, `leave_id`, `total_day`, `reliever`) VALUES ('"+emp_id+"', '"+from+"', '"+to+"', '"+leave_id+"', '"+no_of_days+"', '"+responsible+"');";
                    
                    st.executeUpdate(qry);
               
                }
                    
                     else if("7".equals(request.getParameter("leave-type")))
                {
                    String qry="INSERT INTO `leave_details1` (`emp_id`, `from_date`, `to_date`, `leave_id`, `total_day`, `reliever`) VALUES ('"+emp_id+"', '"+from+"', '"+to+"', '"+leave_id+"', '"+no_of_days+"', '"+responsible+"');";
                    
                    st.executeUpdate(qry);
               
                }
                     
                     
                     
                
                else
                    out.print("Nothing Inserted");
                

                    */
                
                
            }catch(Exception ex){
            
                out.print(ex.getMessage());
            }
            
            %>
            
            <%
              //  String type = "Select type from leave_type where leave_id='"+leave_id+"'";
                %>
                
        
        <br>
        <br>
        
        
        <table border="0" cellpadding="5">
            
            
            
            <tbody>
                
                <tr>
                    <td>Employee ID : </td>
                    <td><%= emp_id%></td>
                </tr>
                <tr>
                    <td>Leave Type : </td>
                    <td><%= leave_id%></td>
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
            </tbody>
        </table>
                
                <br>
        <br>
        <br>
        <br>
        
                
                <table border="0" cellpadding="15">
                   
                    <tbody>
                        <tr>
                            <td>Applicant :</td>
                            
                        </tr>
                        <tr>
                            <td>Reliever :</td>
                        </tr>
                        <tr>
                            <td>Recommended By :</td>
                            
                        </tr>
                        <tr>
                            <td>Approved By :</td>
                        </tr>
                    </tbody>
                </table>


    </center>
        
    </body>
</html>
