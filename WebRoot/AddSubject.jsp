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
<p style="text-align:center; color:red; font-size: 3vw">Student Management System </p>
<center>
<p style="color:yellow; font-size: 2vw">Add Subject</p>
<s:form action="AddSubject">

<label>Subject Code</label><br/>
<input type="text" name="code" placeholder="Enter Subject Code" required><br/>

<label>Subject Name</label><br/>
<input type="text" name="name" placeholder="Enter Subject Name" required><br/>

<label>Select Branch</label><br/>
<select name="branch">
  <option value="IT">Information Technology</option>
  <option value="ISec">Information Security</option>
    <option value="ECE">Electronics</option>
      <option value="Civil">Civil</option>
        <option value="Mech">Mechanical</option>
</select>
<br/>
<br/>
<input type="submit" value="SUBMIT">
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