package sino.java.action.dep;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import org.apache.struts2.interceptor.RequestAware;
import org.springframework.beans.factory.annotation.Autowired;
import sino.java.po.dep.Department;
import sino.java.service.dep.DepService;

public class DepAction implements RequestAware{

	@Autowired
	DepService depService;
	
	private List<Department> deps = new ArrayList<Department>();
	
	private Map<String,Object> request; 
	
	private Department department;
	
	private int depId;
	
	public String execute(){
		deps = depService.findAll(Department.class, 
										"from Department d where d.flag=1");
		request.put("depAll", deps);
		return "index";
	}
	
	public String showAddDep(){
		deps = depService.findAll(Department.class, 
				"from Department d where d.flag=1");
		return "showAddDep";
	}
	
	public String addDep(){
		depService.addDep(department);
		return "addDep";
	}
	
	public String deleteDep(){
		System.out.println("depId------------>"+depId);
		
		Department obj = depService.findById(Department.class, depId);
		
		return "deleteDep";
	}
	
	public String show(){
		return "show";
	}

	public List<Department> getDeps() {
		return deps;
	}

	public void setDeps(List<Department> deps) {
		this.deps = deps;
	}

	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}
	
	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	public int getDepId() {
		return depId;
	}

	public void setDepId(int depId) {
		this.depId = depId;
	}
}
