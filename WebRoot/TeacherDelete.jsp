<%@taglib prefix="s" uri="/struts-tags"%>
<%@page import="java.sql.*"%>
<html>
  <head>
    <title>Welcome to Student Management System </title>
<style>
body {
background-image: url("pexel.jpg");
}
</style>
</head>
<body>
<p style="text-align:center; color:red; font-size: 3vw"">Student Management System </p>

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
ps=con.prepareStatement("delete FROM teacher where id= ?");
ps.setString(1,s1);
int i = ps.executeUpdate();

%>

<center>
<%

if(i > 0)
{
out.print("Teacher Record is Deleted Successfully..........");
%>
<br/>
<br/>
<br/>
<%
}
else
{
out.print("There is a problem in updating Record.");
}

}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}

%>
<br/>
<br/>
<br/>

<a href="Admin.html">Goto Main</a>
</center>
</body>
</html>
