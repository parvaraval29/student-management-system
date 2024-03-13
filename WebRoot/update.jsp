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
<p style="text-align:center; color:red; font-size: 3vw"">Student Management System</p>

<%
String s1;
Connection con;
PreparedStatement ps;
ResultSet rs;

try
{
Class.forName("oracle.jdbc.driver.OracleDriver");
}
 catch (ClassNotFoundException e) {
e.printStackTrace();
}
%>

<%
s1=request.getParameter("id");
try{ 
con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","manager");
ps=con.prepareStatement("Select * FROM student where stu_id= ?");
ps.setString(1,s1);
rs= ps.executeQuery();
while(rs.next()){
%>

<center>
<p style="color:yellow; font-size: 2vw">Update Student Record</p>
<s:form action="update-process.jsp">

<label>Student ID</label><br/>
<input type="text" name="stu_id" value="<%=rs.getString("stu_id")%>"><br/>

<label>Student Name</label><br/>
<input type="text" name="name" value="<%=rs.getString("name")%>" required><br/>

<label>Student Date of Birth</label> <br/>
<input type="date" name="dates" value="<%=rs.getString("dates")%>" required><br/>

<label>Student Email</label><br/>
<input type="text" name="email" value="<%=rs.getString("email")%>" required><br/>

<label>Student Phone</label><br/>
<input type="text" name="phone" value="<%=rs.getString("phone")%>" required><br/>

<label>Please Select Branch</label><br/>
<select name="branch">
  <option value="IT">Information Technology</option>
  <option value="ISec">Information Security</option>
    <option value="ECE">Electronics</option>
      <option value="Civil">Civil</option>
        <option value="Mech">Mechanical</option>
</select>
<br/>

<label>Enter Address</label><br/>
<input type="text" name="address" value="<%=rs.getString("Address")%>" required><br/>
<br>
<input type="submit" value="SUBMIT">
<br/>
<s:property value="msg1"></s:property>
<s:property value="msg2"></s:property>
<br/>
<br/>
</s:form>
<br/>
<br/>
<br/>

 <a href="Admin.html">Menu</a>
</center>


<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>

</body>
</html>
