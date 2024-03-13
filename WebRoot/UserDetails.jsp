<%@taglib prefix="s" uri="/struts-tags"%>
<%@page import="java.sql.*"%>
<html>
  <head>
<title>Welcome to Student Management System </title>
    <link rel="stylesheet" type="text/css"/>
    <script src="min.js"></script>
<script>
$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
</script>
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
input[type=text]
{


	width: 80%;
	padding: 15px;
	margin: 10px 55px;
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
<p style="color:yellow; font-size: 2vw">Student Details</p>
<input id="myInput" type="text" placeholder="Type something in the input field related to student information....." >
<br/>
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

						<th>Student-ID</th>
						<th>Name</th>
						<th>DOB</th>
						<th>Email</th>
						<th>Phone</th>
						<th>Branch</th>
						<th>Address</th>
						<th>Action</th>
			</tr>
		</thead>
	<tbody id="myTable">
  
<%
try{ 
con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","manager");
ps=con.prepareStatement("Select * from student");

rs= ps.executeQuery();
while(rs.next()){
count=count+1;
%>
<tr>

<td align="center"><%=rs.getString("stu_id") %></td>
<td align="center"><%=rs.getString("name") %></td>
<td align="center"><%=rs.getString("dates") %></td>
<td align="center"><%=rs.getString("email") %></td>
<td align="center"><%=rs.getString("phone") %></td>
<td align="center"><%=rs.getString("branch") %></td>
<td align="center"><%=rs.getString("address") %></td>
<td><a href="update.jsp?id=<%=rs.getString("stu_id")%>">Update</a></td>
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
