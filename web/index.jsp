<%-- 
    Document   : index
    Created on : Mar 3, 2020, 1:36:47 PM
    Author     : helpdesk
--%>

<html>
	<head>
		<meta charset="utf-8">
		<title>Login</title>
		<link rel="stylesheet" href="style.css">
	</head>
	<body>
            
                        
			<div class="loginBox">
			<img src="Logo.png" class="user">
                        <br>
                        <br>
                        <br>
                        <br>
			<form action="LoginCheck.jsp" method="post">
				<p>Employee ID</p>
				<input type="text" name="id" placeholder="Employee ID" required>
				<p>Password</p>
				<input type="password" name="password" placeholder="************" required>
				<input type="submit" value="Sign In">	
			</form>
		</div>
	</body>
</html>