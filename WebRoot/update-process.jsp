<%@taglib prefix="s" uri="/struts-tags"%>
<%@page import="java.sql.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.ParseException"%>
<%@page import="java.util.Date"%>

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
Connection con;
PreparedStatement ps;
ResultSet rs;

String stu_id = request.getParameter("stu_id");
String name = request.getParameter("name");
String dates = request.getParameter("dates");
String email = request.getParameter("email");
String phone = request.getParameter("phone");
String branch = request.getParameter("branch");
String address = request.getParameter("address");


try
{
Class.forName("oracle.jdbc.driver.OracleDriver");
con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","manager");
ps=con.prepareStatement("Update student set stu_id=?, name=?, dates=?, email=?, phone=?, branch=?, Address=? where stu_id="+stu_id);
ps.setString(1,stu_id);
ps.setString(2,name);
ps.setString(3,dates);
ps.setString(4,email);
ps.setString(5,phone);
ps.setString(6,branch);
ps.setString(7,address);

int i = ps.executeUpdate();


%>
<center>
<%

if(i > 0)
{
out.print("Student Record is Updated Successfully..........");
%>
<br/>
<br/>
<br/>
<%
}
else
{
out.print("There is a problem in updating Record.");
out.print(stu_id);
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

