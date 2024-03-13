<%@taglib prefix="s" uri="/struts-tags"%>
<%@page import="java.sql.*"%>
<html>
  <head>
<title>Welcome to Student Management System </title>
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
<p style="color:blue; font-size: 2vw">Check Your Registration Number</p>

<form action="CheckReg.jsp" method="post" >
<input type="text" name="email" placeholder="Enter Your Email-ID" required/>
<input type="submit" value="Check"/>
</form>
</center>
<%!
String s1;
Connection con;
PreparedStatement ps;
ResultSet rs;
%>
<%
s1=request.getParameter("email");
try
{
Class.forName("oracle.jdbc.driver.OracleDriver");
}
 catch (ClassNotFoundException e) {
e.printStackTrace();
}
%>
<table>
	<thead>
			<tr bgcolor="#FFA500">

						<th>Student ID</th>
						<th>Name</th>
						<th>Email</th>
						<th>Branch</th>
			</tr>
		</thead>
	<tbody id="myTable">
<%
try{ 
con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","manager");
ps=con.prepareStatement("select * from student where email=?");
ps.setString(1,s1);
rs= ps.executeQuery();
while(rs.next()){
%>
<tr>
<td align="center"><%=rs.getString("stu_id") %></td>
<td align="center"><%=rs.getString("name") %></td>
<td align="center"><%=rs.getString("email") %></td>
<td align="center"><%=rs.getString("branch") %></td>


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
<a href="Student.html">Goto Main</a>
</center>

</body>
</html>
