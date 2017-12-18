package sino.java.action;

import javax.annotation.Resource;

import sino.java.po.User;
import sino.java.service.UserService;

public class UserAction{

	private String name;
	private String password;
	
	@Resource(name="userServiceImpl")
	private UserService ud;
	
	public String execute(){
		System.out.println("UserAction");
		System.out.println("name:"+name+"\r\npassword:"+password);
		User user = new User();
		user.setName(name);
		user.setPassword(password);
		ud.save(user);
		return "success";
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
}
