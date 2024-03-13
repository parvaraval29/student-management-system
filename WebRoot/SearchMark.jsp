<%@taglib prefix="s" uri="/struts-tags"%>
<%@page import="java.sql.*"%>
<html>
  <head>
<title>Student Management System</title>
    <link href="style8.css" rel="stylesheet">
<style>
body {
background-image: url("pexel.jpg");
}
input[type=text]
{
	width: 20%;
	padding: 15px;
	margin: 10px 55px;
	border: 2px solid #aaa;
	border-radius: 4px;
	box-sizing: border-box;
	outline: none;
	transition: 3;
}

table, td, th {
	border: 1px solid White;
}

table {
	border-collapse: collapse;
	width: 100%;
}

th {
	height: 50px;
}
td {
	bgcolor: Black; 
	align: "center";
}
tr{
bgcolor: rgba(0,0,0,0.5);
}
</style>
</head>
<body>
<center>
<p style="text-align:center; color:red; font-size: 3vw"">Student Management System </p>
<p style="color:yellow; font-size: 2vw">Search Mark</p>
<br/>

<form action="SearchMark.jsp" method="post" >
<input type="text" name="stu_id" placeholder="Enter Student ID" required/>

<input type="submit" value="Check"/>
</form>
</center>
<br/>
<br/>
<%!
String s1;
Connection con;
PreparedStatement ps;
ResultSet rs;
%>
<%
s1=request.getParameter("stu_id");
try
{
Class.forName("oracle.jdbc.driver.OracleDriver");
}
 catch (ClassNotFoundException e) {
e.printStackTrace();
}
%>

<table align="center" cellpadding="10" cellspacing="10" border="1">

<tr bgcolor="#4B0082">
<td align="center"><b>Student-ID</b></td>
<td align="center"><b>Student Name</b></td>
<td align="center"><b>Mark(%)</b></td>



</tr>
<%
try{ 
con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","manager");
ps=con.prepareStatement("select * from mark where stu_id=?");
ps.setString(1,s1);
rs= ps.executeQuery();
while(rs.next()){
%>
<tr>
<td align="center"><%=rs.getString("stu_id") %></td>
<td align="center"><%=rs.getString("name") %></td>
<td align="center"><%=rs.getString("avg") %></td>


<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>

</tr>
</table>
<br/>
<br/>
<center>
 <a href="Student.html">Back</a>
</center>
</body>
</html>
