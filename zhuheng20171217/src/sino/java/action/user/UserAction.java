package sino.java.action.user;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import sino.java.po.common.PageView;
import sino.java.po.emp.Employee;
import sino.java.po.group.Group;
import sino.java.po.user.User;
import sino.java.service.emp.EmpService;
import sino.java.service.emp.EmpServiceFind;
import sino.java.service.group.GroupService;
import sino.java.service.group.GroupServiceFinder;
import sino.java.service.user.UserService;
import sino.java.service.user.UserServiceFind;

public class UserAction{
	
	@Autowired 
	private UserService userService;
	
	@Autowired
	private UserServiceFind userFind;
	
	@Autowired
	private GroupService groupService;
	
	@Autowired
	private GroupServiceFinder groupFind;
	
	@Autowired
	private EmpService empService;
	
	@Autowired
	private EmpServiceFind empFind;
	
	private User user = new User();
	
	public String addUser(){
		System.out.println(user.toString());
		return "addUser";
	}
	
	//显示添加用户页面
	public String showAddUser(){
		HttpServletRequest request = ServletActionContext.getRequest();
		List<Group> groups =groupFind.findAll(Group.class, 
				"FROM Group g WHERE g.flag=1");
		request.setAttribute("groups",groups);
		
		return "showAddUser";
	}
	
	public String getEmps(){
		int pageNo =  0;
		int pageSize = 5;
		String str_pageNo;
		HttpServletRequest request = ServletActionContext.getRequest();
//		List<Employee> emps = empFind.findAll(Employee.class, 
//				"FROM Employee e WHERE e.flag=1");
//		request.setAttribute("emps",emps);
		str_pageNo = request.getParameter("pager.offset");
		if(null!=str_pageNo && !str_pageNo.equals("")){
			pageNo = Integer.parseInt(str_pageNo);
		}
		
		PageView<Employee> pv = empFind.findByPage(Employee.class, 
				"FROM Employee e WHERE e.flag=1", pageNo, pageSize);
		pv.setPageSize(pageSize);
		request.setAttribute("pv", pv);
		return "getEmps";
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	
}
