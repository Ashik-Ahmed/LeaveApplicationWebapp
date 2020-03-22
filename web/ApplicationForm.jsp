<%-- 
    Document   : ApplicationForm
    Created on : Oct 31, 2019, 3:28:28 PM
    Author     : helpdesk
--%>

<%@page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <meta charset="utf-8">
         <link rel="stylesheet" href="style.css">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Leave Application</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>
  $( function() {
    var dateFormat = "mm/dd/yy",
      from = $( "#from" )
        .datepicker({
          defaultDate: "+1w",
          changeMonth: true,
          numberOfMonths: 1
        })
        .on( "change", function() {
          to.datepicker( "option", "minDate", getDate( this ) );
        }),
      to = $( "#to" ).datepicker({
        defaultDate: "+1w",
        changeMonth: true,
        numberOfMonths: 1
      })
      .on( "change", function() {
        from.datepicker( "option", "maxDate", getDate( this ) );
      });
 
    function getDate( element ) {
      var date;
      try {
        date = $.datepicker.parseDate( dateFormat, element.value );
      } catch( error ) {
        date = null;
      }
 
      return date;
    }
  } );
  </script>
 
    </head>
    
    
    <body>
        
        
         <ul>
                    <li><a href="index.jsp">Logout</a></li>		    
		    <li><a href="#">Apply</a></li>
                    <li><a href="dashboard.jsp" class="active">Home</a></li> 
            
        </ul>
        
        <h1>Leave Application</h1>
        
        <form name="emp_details" action="Preview.jsp" method="POST">
            
            
        Employee ID : <% out.print(""+session.getAttribute("id").toString()); %>
                        
                  
               
            
            
            
                <fieldset>
                    <legend style="padding:20px 0; font-size:20px; color: black; font-style: oblique">Leave details:</legend>
                
                <table border="0" cellpadding="5">
                    <tbody>
                        
                        <br>
                        
                        <tr>
                            <td>Leave Type: </td>
                            <td>
                                    <select name="leave-type" class="form-control" style="width: 250px;">
                                    <option value="-1">Select Leave Type</option>
            
            <%
                
                try
                {
                    String Query="Select * from leave_type";
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/leave_management","root","");
                    Statement stm=conn.createStatement();
                    ResultSet rs=stm.executeQuery(Query);
                    while(rs.next())
                    {
                        %>
                        <option value="<%=rs.getInt("leave_id")%>"><%=rs.getString("type")%></option>
                        <%
                    }
                    
                }catch(Exception ex)
                {
                    ex.printStackTrace();
                    out.println("Error"+ex.getMessage());
                }
                
                %>
                  
              
        </select>
                
                
                        </tr>
                        <tr>
                                <label for="from"> From: </label>
                                <input type="text" id="from" name="from">
                                <label for="to">  To: </label>
                                <input type="text" id="to" name="to">
                        </tr>
                      
                        <br>
                        <br>
                        
                        <tr>
                            <td>Total Day : </td>
                            <td><input type="text" name="total_day" value="" /></td>
                        </tr>
                      
                        
                        <tr>
                            <td>Responsible Person : </td>
                            <td><input type="text" name="responsible_person" value="" /></td>
                        </tr>
                   
                        
                    </tbody>
                </table>

       
            </fieldset>
            <br>
                <br>
          
                <br>
                <br>
            
            <input type="submit" value="Submit" name="submit" />
              
        </form>
                
    
        
   </body>
</html>
