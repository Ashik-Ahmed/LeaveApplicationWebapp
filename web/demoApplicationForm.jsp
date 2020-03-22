<%-- 
    Document   : demoApplicationForm
    Created on : Feb 15, 2020, 5:24:58 PM
    Author     : helpdesk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>
  $( function() {
    var dateFormat = "mm-dd-yy",
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
  
  <style>
      
      .applyBox
{
	position: absolute;
	margin-top: 420px;
	left: 50%;
	transform: translate(-50%,-50%);
	width: 600px;
	height: 800px;
	padding: 10px;
        padding-top: 0px;
        text-align: center;
	box-sizing: border-box;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.50);
        background-color: #37d0d2;
        border-radius: 5px 5px 5px 5px;
}

.applyBox input[type="text"]
{
	border: none;
	border-bottom: 1px solid #fff;
	background: white;
        width: 80%;
        padding: 10px;
        border-radius: 4px;
	outline: none;
	margin: 8px;
        resize: vertical;
	color: #000;
	font-size: 16px;
        display: inline-block;
}

.applyBox input[type="submit"]
{
	background-color: #4CAF50; 
        color: white; 
        margin: 5px; 
        margin-top: 30px;
        padding: 10px; 
        font-weight: bold;
        border: none; 
        border-radius: 4px;
}
.applyBox input[type=submit]:hover {
  background-color: #45a049;
}

.applyBox input[type="reset"]
{
        background-color: #d60d08; 
        color: white; 
        margin: 5px;
        margin-top: 30px;
        padding: 10px; 
        font-weight: bold;
        border: none; 
        border-radius: 4px;
}
.applyBox input[type=reset]:hover {
    background-color: #b10c25;
}

.applyBox input[name="leave-type"]
{
	border: none;
	background: white;
        width: 80%;
        padding: 10px;
        border-radius: 4px;
	outline: none;
	margin: 8px;
        resize: vertical;
	color: #000;
	font-size: 16px;
        display: inline-block;
}


label {
    float: left;
    padding: 12px 12px 12px 0;
    display: inline-block;
}
      
::placeholder {
  color: grey;
  opacity: 1; 
}

:-ms-input-placeholder {
  color: grey;
}

::-ms-input-placeholder {
  color: grey;
}

  </style>
  
  
        <title>Demo Application</title>
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
                    <li><a href="index.jsp"><%= session.getAttribute("name")%></a></li>
                    <li><a href="PendingRequests.jsp">Pending Requests</a></li>
                    <li><a href="EquipmentList.jsp">Equipment Management</a></li>
                    <li><a href="CheckStatus.jsp">Check Status</a></li>
		    <li><a href="#" class="active">Apply</a></li>
                    <li><a href="dashboard.jsp">Home</a></li> 
            
                        </ul>
                        <%
                    }


                    else
                        {
                           %>
                            <ul>
                                <li><a href="index.jsp"><%= session.getAttribute("name")%></a></li>		    
                                <li><a href="#" class="active">Apply</a></li>
                                <li><a href="dashboard.jsp">Home</a></li> 
            
                            </ul>
                           <%
                            
                            }
        
                      
                            }

                            
                
            }
             catch(Exception ex)
             {
                 out.print(ex.getMessage());
             }
             

                    %>

        
        <div class="applyBox">
            
            <img src="leisure.jpg" width="600px" height="180" alt="leisure" style="margin-left: -10px;  border-radius: 5px 5px 0 0"/>

        
        
        <div style="padding: 50px; padding-top: 0px">
            
           
            <p align="center" style="font-size: 30px">Leave Application Form</p>
            <p align="center" style="font-size: 15px; color: grey">Please Fill up this form to request your leave</p>
            
            <form name="applicationForm" action="demoPreview.jsp" method="POST">
                
                
                <input type="text" id="from" name="from" size="40" placeholder="Leave Start Date" required> <br>
                <input type="text" id="to" name="to" size="40" placeholder="Leave End Date" required> <br>
                
                <input type="text" name="total" value="" size="40" placeholder="Total Days" required/> <br>
                
                
                <select name="leave-type" style="width: 85%; border-radius: 4px; border: none; padding: 10px; margin: 8px; display: inline-block; resize: vertical; font-size: 16px;">
                    <option value="-1">Select Leave Type</option>
            
            <%
                
                /*
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/leave_management","root","");
                    Statement st=null;
                    ResultSet rs=null;
                    */
                
                try
                {
                    
                    st=conn.createStatement();
                    String Query="Select * from leave_type";
                    rs=st.executeQuery(Query);
                    
                    while(rs.next())
                    {
                        %>
                        <option value="<%=rs.getInt("leave_id")%>"><%=rs.getString("type")%></option>
                        <%
                    }

                    
                    
                }catch(Exception ex)
                {
                    ex.printStackTrace();
                    out.println("Error: "+ex.getMessage());
                }

/*
                String qry2 = "select leave_type.days, sum(leave_details1.total_day) as Taken from `leave_details1` inner join leave_type on leave_details1.leave_id=leave_type.leave_id where emp_id = '"+session.getAttribute("id")+"' group by leave_details1.leave_id";               
                rs = st.executeQuery(qry2);

                if(rs.next())
                            {
                    
                                int rem = (Integer.parseInt(rs.getString(1)))-(Integer.parseInt(rs.getString(2)));
                                
                                if(rem<=Integer.parseInt(request.getParameter("total")))
                                    {
                                    
                                        conn.close();
                                        response.sendRedirect("demoApplicationForm.jsp");
                                    
                                        }

                                else
                                    {
                                        conn.close();
                                        response.sendRedirect("demoPreview.jsp");
                                    }

                            }

                

                conn.close();
*/
                
                %>
                  
              
        </select>
                <input type="text" name="reliever" value="" size="40" placeholder="Reliever" required/> <br>
                <textarea name="comment" placeholder="Comment.." style="height:75px; border: none; border-radius: 4px; width: 84%"></textarea> <br>
                <label>Add File</label>
                <input type="file" name="attachment" value="" style="background-color: white; width: 45%; padding-left: 0px; padding: 5px; border-radius: 4px; outline: none; margin-left: 0px; margin: 10px;"/> <br>
                <input type="submit" value="Submit" name="submit" style=""/>
                <input type="reset" value="Cancel" name="cancel"/><br>
                
                
            </form>
            
        </div>
              
        </div>
        
    </body>
</html>
