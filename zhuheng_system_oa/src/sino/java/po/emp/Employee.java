package sino.java.po.emp;

import java.io.Serializable;

import sino.java.po.dep.Department;
import sino.java.po.user.User;

public class Employee implements Serializable{

	private static final long serialVersionUID = 1L;

	private int emp_id;
	
	private String emp_name;
	
	private String emp_sn;
	
	private String emp_sex;
	
	private String emp_address;
	
	private String emp_phone;
	
	private String emp_job;
	
	private String emp_img;
	
	private Department dep;
	
	private int flag;
	
	private User user;

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public int getFlag() {
		return flag;
	}

	public void setFlag(int flag) {
		this.flag = flag;
	}

	public int getEmp_id() {
		return emp_id;
	}

	public String getEmp_sn() {
		return emp_sn;
	}

	public void setEmp_sn(String emp_sn) {
		this.emp_sn = emp_sn;
	}

	public void setEmp_id(int emp_id) {
		this.emp_id = emp_id;
	}

	public String getEmp_name() {
		return emp_name;
	}

	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}

	public String getEmp_sex() {
		return emp_sex;
	}

	public void setEmp_sex(String emp_sex) {
		this.emp_sex = emp_sex;
	}

	public String getEmp_address() {
		return emp_address;
	}

	public void setEmp_address(String emp_address) {
		this.emp_address = emp_address;
	}

	public String getEmp_phone() {
		return emp_phone;
	}

	public void setEmp_phone(String emp_phone) {
		this.emp_phone = emp_phone;
	}

	public String getEmp_job() {
		return emp_job;
	}

	public void setEmp_job(String emp_job) {
		this.emp_job = emp_job;
	}

	public String getEmp_img() {
		return emp_img;
	}

	public void setEmp_img(String emp_img) {
		this.emp_img = emp_img;
	}

	public Department getDep() {
		return dep;
	}

	public void setDep(Department dep) {
		this.dep = dep;
	}
}
