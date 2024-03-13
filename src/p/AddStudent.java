package p;

import java.sql.*;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class AddStudent extends ActionSupport {

	String name, dates, email, phone, branch, address;
	String msg1, msg2;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDates() {
		return dates;
	}

	public void setDates(String dates) {
		this.dates = dates;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getBranch() {
		return branch;
	}

	public void setBranch(String branch) {
		this.branch = branch;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
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
	PreparedStatement ps=con.prepareStatement("insert into student values(stuseq.nextval,?,?,?,?,?,?)");
	ps.setString(1,name);
	ps.setString(2,dates);
	ps.setString(3,email);
	ps.setString(4,phone);
	ps.setString(5,branch);
	ps.setString(6,address);

	ps.executeUpdate();          

	con.commit();

	ps.close();
	con.close();
	setMsg1("Registration Completed Successfully..............");
	return "success";

	}
	catch(Exception e){
		e.printStackTrace();
		setMsg2("Please Check your Input...........");
			return "fail";
	}

	}

}
