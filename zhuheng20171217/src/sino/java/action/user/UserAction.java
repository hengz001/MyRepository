package sino.java.action.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Serializable;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import sino.java.common.PageView;
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
	
	private int u_id;
	
	public String login(){
		HttpServletRequest request = ServletActionContext.getRequest();
		User obj  = userFind.login(user);
		if(null == obj){
			return "unlogin";
		}else{
			request.getSession().setAttribute("person", obj);
			return "login";
		}
	}
	
	public String deleteUser(){
		userService.deleteByLogic(User.class,new Serializable[]{u_id} , "u_id", "flag");
		return "deleteUser";
	}
	
	//ajax
	public String showUser(){
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/xml;charset=utf-8");
		
		try {
			PrintWriter out = response.getWriter();
			User user = userFind.findById(User.class,u_id); 
			Employee emp = user.getEmp();

			out.println("<users>");
			out.println("<user>");
			
			out.println("<user-id>"+emp.getEmp_id()+"</user-id>");
			out.println("<user-trueName>"+emp.getEmp_name()+"</user-trueName>");
			out.println("<user-name>"+user.getU_name()+"</user-name>");
			out.println("<user-password>"+user.getU_pwd()+"</user-password>");
			out.println("<user-sex>"+emp.getEmp_sex()+"</user-sex>");
			out.println("<user-job>"+emp.getEmp_job()+"</user-job>");
			out.println("<user-phone>"+emp.getEmp_phone()+"</user-phone>");
			out.println("<user-address>"+emp.getEmp_address()+"</user-address>");
			out.println("<user-sn>"+emp.getEmp_sn()+"</user-sn>");
			
			out.println("</user>");
			out.println("</users>");
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return null;
	}

	
	public String addUser(){
		user.setFlag(1);
		userService.save(user);
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
	
	public int getU_id() {
		return u_id;
	}

	public void setU_id(int u_id) {
		this.u_id = u_id;
	}

	
	
}
