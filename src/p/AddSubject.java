package p;
import java.sql.*;
import com.opensymphony.xwork2.ActionSupport;


@SuppressWarnings("serial")
public class AddSubject extends ActionSupport 
{
	String code, name, branch;
	String msg1, msg2;

public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
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
PreparedStatement ps=con.prepareStatement("insert into subject values(?,?,?)");
ps.setString(1,code);
ps.setString(2,name);
ps.setString(3,branch);

ps.executeUpdate();          

con.commit();

ps.close();
con.close();
setMsg1("Subject Added Successfully..............");
return "success";

}
catch(Exception e){
	e.printStackTrace();
	setMsg2("Please Check your Input...........");
		return "fail";
}

}

}