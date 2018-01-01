package sino.java.action.dep;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;
import org.springframework.beans.factory.annotation.Autowired;

import sino.java.po.common.PageView;
import sino.java.po.dep.Department;
import sino.java.service.dep.DepService;
import sino.java.service.dep.DepServiceFind;

public class DepAction implements RequestAware{

	@Autowired
	DepService depService;
	
	@Autowired
	DepServiceFind depServiceFind;
	
	private List<Department> deps = new ArrayList<Department>();
	
	private Map<String,Object> request; 
	
	private Department department;
	
	private int depId;
	private String depName;
	private String depSn;
	private String depDesc;
	private String type;
	
	public String execute(){
		deps = depServiceFind.findAll(Department.class, 
				"from Department d where d.flag=1");
		request.put("depAll", deps);
		return "index";
	}
	
	public String showAddDep(){
		deps = depServiceFind.findAll(Department.class, 
				"from Department d where d.flag=1");
		return "showAddDep";
	}
	
	public String addDep(){
		depService.addDep(department);
		return "addDep";
	}
	
	public String deleteDep(){
		if(0 != depId){
			depService.deleteByLogic(Department.class,new Serializable[]{depId}, "dep_id", "flag");
		}
		return "deleteDep";
	}
	
	public String updateDep(){
		if(0 != depId){
			Department dep = new Department();
			dep.setDep_id(depId);
			dep.setDep_sn(depSn);
			dep.setDep_name(depName);
			dep.setDep_desc(depDesc);
			dep.setFlag(1);
			depService.saveOrUpdate(dep);
		}
		return "updateDep";
	}
	
	public String findByPage(){
		int pageNo = 0;
		String pageNo_str = ServletActionContext.getRequest().getParameter("pager.offset");
		if(null != pageNo_str){
			System.out.println(pageNo_str);
			pageNo = Integer.parseInt(pageNo_str);
		}
		int pageSize = 5;
		PageView<Department> pv;
		if(null != type && !type.equals("")){
			pv = depServiceFind.findByPage(Department.class, 
					"FROM Department d WHERE d.dep_name=?",type,pageNo, pageSize);
		}else{
			pv = depServiceFind.findByPage(Department.class, "FROM Department d", pageNo, pageSize);
		}
		
		request.put("pv", pv);
		return "findByPage";
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

	public String getDepName() {
		return depName;
	}

	public void setDepName(String depName) {
		this.depName = depName;
	}

	public String getDepSn() {
		return depSn;
	}

	public void setDepSn(String depSn) {
		this.depSn = depSn;
	}

	public String getDepDesc() {
		return depDesc;
	}

	public void setDepDesc(String depDesc) {
		this.depDesc = depDesc;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
}
