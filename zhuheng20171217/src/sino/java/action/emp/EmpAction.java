package sino.java.action.emp;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Serializable;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import sino.java.common.PageView;
import sino.java.po.dep.Department;
import sino.java.po.emp.Employee;
import sino.java.service.dep.DepServiceFind;
import sino.java.service.emp.EmpService;
import sino.java.service.emp.EmpServiceFind;

public class EmpAction {
	
	@Autowired
	private DepServiceFind depServiceFind;
	
	@Autowired
	private EmpService empService;
	
	@Autowired
	private EmpServiceFind empServiceFind;
	
	private File image;
	
	private String imageFileName;
	
	private Employee emp = new Employee();
	
	private String depId;
	
	public String findEmp(){
		String job;
		String dep;
		String name;
		int depId;
		String address;
		String job01;
		String dep01;
		String name01;
		String address01;
		String sPageNo;
		int pageNo = 0;
		int pageSize= 5;
		
		StringBuffer sb = new StringBuffer();
		List<Object> parameter = new ArrayList<Object>();
		HttpServletRequest request = ServletActionContext.getRequest();
	
		job01 = request.getParameter("job01");
		if(null!=job01 && !job01.equals("")){
			
			try {
				job01 = new String(job01.getBytes("iso-8859-1"),"utf-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			
			sb.append(" AND ");
			sb.append("e.emp_job=?");
			parameter.add(job01.trim());
			request.setAttribute("job01",job01);
		}
		
		name01 = request.getParameter("name01");
		if(null!=name01 && !name01.equals("")){
			try {
				name01 = new String(name01.getBytes("iso-8859-1"),"utf-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			sb.append(" AND ");
			sb.append("e.emp_name=?");
			System.out.println(name01);
			parameter.add(name01.trim());
			request.setAttribute("name01",name01);
		}
		
		dep01 = request.getParameter("dep01");
		if(null!=dep01 && !dep01.equals("请选择")){
			try {
				dep01 = new String(dep01.getBytes("iso-8859-1"),"utf-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			sb.append(" AND ");
			sb.append("e.dep.dep_id=?");
			depId = Integer.parseInt(dep01);
			Serializable id = depId;
			parameter.add(id);
			request.setAttribute("dep01",dep01);
		}
		
		address01 = request.getParameter("address01");
		if(null!=address01 && !address01.equals("")){
			try {
				address01 = new String(address01.getBytes("iso-8859-1"),"utf-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			sb.append(" AND ");
			sb.append("e.emp_address=?");
			parameter.add(address01.trim());
			request.setAttribute("address01",address01);
		}
		
		job = request.getParameter("job");
		if(null!=job && !job.equals("")){
			sb.append(" AND ");
			sb.append("e.emp_job=?");
			parameter.add(job.trim());
			request.setAttribute("job01",job);
		}
		
		name = request.getParameter("name");
		if(null!=name && !name.equals("")){
			sb.append(" AND ");
			sb.append("e.emp_name=?");
			System.out.println(name);
			parameter.add(name.trim());
			request.setAttribute("name01",name);
		}
		
		dep = request.getParameter("dep");
		if(null!=dep && !dep.equals("请选择")){
			sb.append(" AND ");
			sb.append("e.dep.dep_id=?");
			depId = Integer.parseInt(dep);
			Serializable id = depId;
			parameter.add(id);
			request.setAttribute("dep01",dep);
		}
		
		address = request.getParameter("address");
		if(null!=address && !address.equals("")){
			sb.append(" AND ");
			sb.append("e.emp_address=?");
			parameter.add(address.trim());
			request.setAttribute("address01",address);
		}
		
		sPageNo = request.getParameter("pager.offset");
		if(null!=sPageNo && !sPageNo.equals("")){
			pageNo = Integer.parseInt(sPageNo);
		}
		
		PageView<Employee> pv = empServiceFind.findByPage(Employee.class, "FROM Employee e WHERE e.flag=1 "+sb.toString(),parameter.toArray(),pageNo, pageSize);
		pv.setPageSize(pageSize);
		request.setAttribute("pv", pv);
		return "findEmp";
	}
	
	public String showEmp(){
		HttpServletRequest request = ServletActionContext.getRequest();
		int empId = 0;
		String strId = request.getParameter("empId");
		if(null == strId){
			return null;
		}
		empId = Integer.parseInt(strId);
		emp = empServiceFind.findById(Employee.class, empId);
		request.setAttribute("emp",emp);
		return "showEmp";
	}
	
	public String deleteEmp(){
		HttpServletRequest request = ServletActionContext.getRequest();
		String strs[] = request.getParameterValues("cc");
		
		int i=strs.length;
		
		Serializable ses[] = new Serializable[i];
		
		i=0;
		for(String str : strs){
			ses[i++] = Integer.parseInt(str);
		}
		empService.deleteByLogic(Employee.class, ses, "emp_id", "flag");
		return "deleteEmp";
	}
	
	public String execute(){
		HttpServletRequest request = ServletActionContext.getRequest();
		int pageSize = 5;
		int pageNo = 0;
		String pageNo_str = request.getParameter("pager.offset");
		if(null != pageNo_str){
			pageNo = Integer.parseInt(pageNo_str); 
		}
		PageView<Employee> pv = empServiceFind.findByPage(Employee.class, "FROM Employee e",pageNo,pageSize);
		request.setAttribute("pv",pv);
		return "index";
	}
	
	//add employee
	public String addEmp(){
		String path = "/WEB/imgs/emp";
		int dep_id = 0;
		
		String realPath = ServletActionContext.getServletContext().getRealPath(path);
		System.out.println(realPath);
		System.out.println(imageFileName);
		if(null == imageFileName){
			return null;
		}
		File saveFile = new File(new File(realPath),imageFileName);
		if(!saveFile.getParentFile().exists()){
			saveFile.getParentFile().mkdirs();
		}
		try {
			FileUtils.copyFile(image, saveFile);
		} catch (IOException e) {
			e.printStackTrace();
		}
		if(depId != null && !"".equals(depId)){
			dep_id = Integer.parseInt(depId);
		}
		emp.setDep(depServiceFind.findById(Department.class, dep_id));
		emp.setEmp_img(path+imageFileName);
		empService.save(emp);
		emp.setFlag(1);
		return "addEmp";
	}
	
	//home page
	public String index(){
		List<Department> deps = depServiceFind.findAll(Department.class, "FROM Department d WHERE d.parent=null AND d.flag = 1");
		List<Department> depss = depServiceFind.findAll(Department.class, "FROM Department d WHERE d.flag = 1");
		ServletActionContext.getRequest().setAttribute("deps", deps);
		ServletActionContext.getRequest().setAttribute("depss", depss);
		
		HttpServletRequest request = ServletActionContext.getRequest();
		int pageSize = 5;
		int pageNo = 0;
		String pageNo_str = request.getParameter("pager.offset");
		if(null != pageNo_str){
			pageNo = Integer.parseInt(pageNo_str); 
		}
		PageView<Employee> pv = empServiceFind.findByPage(Employee.class, "FROM Employee e WHERE e.flag=1",pageNo,pageSize);
		request.setAttribute("pv",pv);
		
		return "index";
	}
	
	public String findByDep(){
		int iPid = 0;
		HttpServletResponse response;
		PrintWriter out;
		
		if(null == depId || depId.equals("")){
			return null;
		}
		iPid = Integer.parseInt(depId);
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

	public String getDepId() {
		return depId;
	}

	public void setDepId(String depId) {
		this.depId = depId;
	}

	public File getImage() {
		return image;
	}

	public void setImage(File image) {
		this.image = image;
	}

	public String getImageFileName() {
		return imageFileName;
	}

	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}

	public Employee getEmp() {
		return emp;
	}

	public void setEmp(Employee emp) {
		this.emp = emp;
	}
}
