package p;
import java.sql.*;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class TLogin extends ActionSupport
{
	String username, password,msg;
	
public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

public String execute(){
	try
	{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","manager");
	PreparedStatement ps=con.prepareStatement("select * from teacher where username = ? and password = ?");
	ps.setString(1,this.username);
	ps.setString(2,this.password);
	ResultSet rs=ps.executeQuery();
	if(rs.next())
	{
	con.close();
	return "ok";
	}
	else
	{
	setMsg("Check your Username and Password");
	return"fail";
	}
	}
	catch(Exception e)
	{
	}
	return "fail";
	}
	}
