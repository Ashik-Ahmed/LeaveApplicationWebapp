<%-- 
    Document   : LoadData
    Created on : Nov 6, 2019, 12:58:42 PM
    Author     : helpdesk
--%>
<%@ page import="java.sql.*"%>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DB load</title>
    </head>
    <body>
        <h1>Database Data : </h1>
        
        <%!
                public class Actor {
                        
                        String URL = "jdbc:mysql://localhost:3306/leave_record";
                        String USERNAME = "root";
                        String PASSWORD = "root";

                        Connection connection = null;
                        PreparedStatement selectActors = null;
                        ResultSet resultSet = null;
                        
                        public Actor(){

                            try{
                                connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);

                                selectActors = connection.prepareStatement(
                                "SELECT emp_id, name, mobile, designation FROM emp_info");
                            } catch(SQLException e) {   
                                e.printStackTrace();

            }

}

                        public ResultSet getActors(){

                                try{

                                    resultSet = selectActors.executeQuery();

                            } catch(SQLException e){
                                    
                                    e.printStackTrace();
}
                        return resultSet;
}
}
               
                    Actor actor = new Actor();
                    ResultSet actors = actor.getActors();
                    %>
                    
                     <br>
        <br>
        
        <table border="0">
            
            <tbody>
                <tr>
                    <td>ID</td>
                    <td>Name</td>
                    <td>Mobile</td>
                    <td>Designation</td>
                </tr>
                
                <% while (actors.next()) {%>
                
                <tr>
                    <td><%= actors.getInt("emp_id")%></td>
                    <td><%= actors.getString("name")%></td>
                    <td><%= actors.getString("mobile")%></td>
                    <td><%= actors.getString("designation")%></td>
                </tr>
                
                <% } %>
            </tbody>
        </table>
    </body>
</html>
