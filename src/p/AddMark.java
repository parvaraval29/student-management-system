package p;
import java.sql.*;
import com.opensymphony.xwork2.ActionSupport;


@SuppressWarnings("serial")
public class AddMark extends ActionSupport 
{
	String stu_id, name, sub1, sub3, sub2; 
	int mark1, mark2, mark3;
	String msg1, msg2;

public String getStu_id() {
		return stu_id;
	}

	public void setStu_id(String stuId) {
		stu_id = stuId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSub1() {
		return sub1;
	}

	public void setSub1(String sub1) {
		this.sub1 = sub1;
	}

	public String getSub3() {
		return sub3;
	}

	public void setSub3(String sub3) {
		this.sub3 = sub3;
	}

	public String getSub2() {
		return sub2;
	}

	public void setSub2(String sub2) {
		this.sub2 = sub2;
	}

	public int getMark1() {
		return mark1;
	}

	public void setMark1(int mark1) {
		this.mark1 = mark1;
	}

	public int getMark2() {
		return mark2;
	}

	public void setMark2(int mark2) {
		this.mark2 = mark2;
	}

	public int getMark3() {
		return mark3;
	}

	public void setMark3(int mark3) {
		this.mark3 = mark3;
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

int total, avg;


public int getTotal() {
	return total;
}

public void setTotal(int total) {
	this.total = total;
}

public int getAvg() {
	return avg;
}

public void setAvg(int avg) {
	this.avg = avg;
}

public String execute()
{
try
{
total =(mark1+mark2+mark3);
avg=(total/3);

Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","manager");
PreparedStatement ps=con.prepareStatement("insert into mark values(?,?,?,?,?,?,?,?,?,?)");
ps.setString(1,stu_id);
ps.setString(2,name);
ps.setString(3,sub1);
ps.setString(4,sub2);
ps.setString(5,sub3);
ps.setInt(6,mark1);
ps.setInt(7,mark2);
ps.setInt(8,mark3);
ps.setInt(9,total);
ps.setInt(10,avg);

ps.executeUpdate();          

con.commit();

ps.close();
con.close();
setMsg1("Mark Added Successfully..............");
return "success";

}
catch(Exception e){
	e.printStackTrace();
	setMsg2("Please Check your Input...........");
		return "fail";
}

}

}