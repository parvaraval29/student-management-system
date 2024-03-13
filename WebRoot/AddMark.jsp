<%@taglib prefix="s" uri="/struts-tags"%>
<%@page import="java.sql.*"%>
<html>
  <head>
<title>Welcome to Student Management System </title>
<style>
body {
background-image: url("pexel.jpg");
}
input[type=text]
{
	width: 20%;
	padding: 15px;
	margin: 10px 46px;
	border: 2px solid #aaa;
	border-radius: 4px;
	box-sizing: border-box;
	outline: none;
	transition: 3;
}
input[type=date]
{
	width: 20%;
	padding: 15px;
	margin: 10px 46px;
	border: 2px solid #aaa;
	border-radius: 4px;
	box-sizing: border-box;
	outline: none;
	transition: 3;
}
input[type=text]:focus{
border-color: green;
box-shadow: 0 0 8px 0 green;
}
input[type=submit]
{
	width: 100%
	background-color: #4CAF50;
	color: green;
	padding: 14px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}
input[type=submit]:hover
{
background-color:#45a049;
}
select
{
	width: 20%;
	padding: 15px;
	margin: 10px 12px;
	border: 2px solid #aaa;
	border-radius: 4px;
	box-sizing: border-box;
	outline: none;
	transition: 3;
}
</style>
</head>
<body>
<p style="text-align:center; color:red; font-size: 3vw"">Student Management System </p>
<center>
<p style="color:yellow; font-size: 2vw">Add Student Mark</p>
<s:form action="AddMark">

<label>Student ID</label><br/>
<input type="text" name="stu_id" placeholder="Enter Student ID" required><br/>

<label>Student Name</label><br/>
<input type="text" name="name" placeholder="Enter Student Name" required><br/>

<p style="text-align:center; color:blue; font-size: 2vw">Enter Student Subjects and Mark</p><br>

<input type="text" name="sub1" placeholder="Enter First Subject" required>
<input type="text" name="mark1" placeholder="Enter Mark" required>

<br/>
<br/>

<input type="text" name="sub2" placeholder="Enter Second Subject" required>
<input type="text" name="mark2" placeholder="Enter Mark" required>

<br/>
<br/>

<input type="text" name="sub3" placeholder="Enter Third Subject" required>
<input type="text" name="mark3" placeholder="Enter Mark" required>
<br/>
<br/>
<br/>
<input type="submit" value="SUBMIT">
<br/>
<br/>
<s:property value="msg1"></s:property>
<s:property value="msg2"></s:property>
<br/>
<br/>
 <a href="Admin.html">Menu</a>
</s:form>
</center>
</body>
</html>