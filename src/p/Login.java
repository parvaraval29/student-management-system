package p;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class Login extends ActionSupport
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

public String execute()
{
if(this.username.equals("admin") && this.password.equals("admin123"))
{
	return "ok";
}

else
{
	setMsg("!!!...Check Username & Password...!!!");
	return"fail";
}
}
}



