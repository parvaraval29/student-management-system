<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<title>Student Management System </title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<div class="loginbox">
	<img src="Admin.png" class="avater">
	
	<h1>Please login here </h1>
	<br/>
	<br/>
		<s:form action="Login">
		<center>
		  <p>User Name</p>
		<input type="text" name="username" placeholder="Enter Username"> <br/> <br/>
		<p>Password</p>
		<input type="password" name="password" placeholder="Enter Password"><br> <br/>
		
		<input type="submit" name="" value="Login"><br>
		<center><s:property value="msg"></s:property></center>
		<br/>
	
	<a href="index.jsp" > Goto Main </a>
	</center>
	</s:form>
	
</div>
</body>
</html>
