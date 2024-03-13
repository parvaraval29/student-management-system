package p;

import java.sql.*;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class AddTeacher extends ActionSupport {

	String name, branch, doj, expr, username, password;
	String msg1, msg2;

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

	public String getDoj() {
		return doj;
	}

	public void setDoj(String doj) {
		this.doj = doj;
	}

	public String getExpr() {
		return expr;
	}

	public void setExpr(String expr) {
		this.expr = expr;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBranch() {
		return branch;
	}

	public void setBranch(String branch) {
		this.branch = branch;
	}

	public String getMsg1() {
		return msg1;
	}

	public void setMsg1(String msg1) {
		this.msg1 = msg1;
	}

	public String getMsg2() {
		return msg2;
	}

	public void setMsg2(String msg2) {
		this.msg2 = msg2;
	}


	public String execute()
	{
	try
	{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","manager");
	PreparedStatement ps=con.prepareStatement("insert into teacher values(tseq.nextval, ?,?,?,?,?,?)");
	ps.setString(1,name);
	ps.setString(2,branch);
	ps.setString(3,doj);
	ps.setString(4,expr);
	ps.setString(5,username);
	ps.setString(6,password);
	
	ps.executeUpdate();          

	con.commit();

	ps.close();
	con.close();
	setMsg1("Teacher Added Successfully..............");
	return "success";

	}
	catch(Exception e){
		e.printStackTrace();
		setMsg2("Please Check your Input...........");
			return "fail";
	}

	}

}
