package sino.java.action.emp;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import sino.java.po.dep.Department;
import sino.java.service.dep.DepServiceFind;

public class EmpAction {
	
	@Autowired
	private DepServiceFind depServiceFind;
	
	private String pid;
	
	public String execute(){
		return "index";
	}
	
	//home page
	public String index(){
		List<Department> deps = depServiceFind.findAll(Department.class, "FROM Department d WHERE d.parent=null AND d.flag = 1");
		ServletActionContext.getRequest().setAttribute("deps", deps);
		return "index";
	}
	
	public String findByDep(){
		int iPid = 0;
		HttpServletResponse response;
		PrintWriter out;
		
		if(null == pid || pid.equals("")){
			return null;
		}
		iPid = Integer.parseInt(pid);
		List<Department> deps = depServiceFind.findAll(Department.class, "FROM Department d WHERE d.flag=1 AND d.parent.dep_id="+iPid);
		response = ServletActionContext.getResponse();
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/xml;charaset=UTF-8");
		try {
			out = response.getWriter();
		} catch (IOException e) {
			return null;
		}
		
		out.write("<subDeps>");
		for (Department department : deps) {
			out.write("<subDep>");
			out.write("<subDep-name>"+department.getDep_name()+"</subDep-name>");
			out.write("<subDep-id>"+department.getDep_id()+"</subDep-id>");
			out.write("</subDep>");
		}
		out.write("</subDeps>");
		return null;
	}

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}
}
