<%@taglib prefix="s" uri="/struts-tags"%>
<%@page import="java.sql.*"%>
<html>
  <head>
<title>Welcome to Student Management System </title>
    <link rel="stylesheet" type="text/css"/>
<style>
body {
background-image: url("pexel.jpg");
}
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 2px solid #dddddd;
  text-align: left;
  padding: 8px;
}
tr{
bgcolor: rgba(0,0,0,.5)
}
tr:nth-child(even) {
  background-color: rgba(0,0,0,0.5);
}
</style>
</head>
<p style="text-align:center; color:red; font-size: 3vw"">Student Management System </p>
<center>
<p style="color:yellow; font-size: 2vw">Teacher Details</p>
</center>
<%
int count=0;
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
<table>
	<thead>

			<tr bgcolor="#FFA500">
			
						<th>Teacher ID</th>
						<th>Teacher Name</th>
						<th>Department</th>
						<th>Date of Joining</th>
						<th>Experience</th>
						<th>Username</th>
						<th>Password</th>
						<th>Action</th>
			</tr>
		</thead>
	<tbody id="myTable">
  
<%
try{ 
con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","manager");
ps=con.prepareStatement("Select * from teacher");

rs= ps.executeQuery();
while(rs.next()){
count=count+1;
%>
<tr>

<td align="center"><%=rs.getString("id") %></td>
<td align="center"><%=rs.getString("name") %></td>
<td align="center"><%=rs.getString("branch") %></td>
<td align="center"><%=rs.getString("doj") %></td>
<td align="center"><%=rs.getString("expr") %></td>
<td align="center"><%=rs.getString("username") %></td>
<td align="center"><%=rs.getString("password") %></td>
<td><a href="TeacherDelete.jsp?id=<%=rs.getString("id")%>">Delete</a></td>
<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>

</tr>
</tbody>
</table>
</body>
</html>
