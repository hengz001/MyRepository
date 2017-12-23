package sino.java.action.dep;

import org.springframework.beans.factory.annotation.Autowired;

import sino.java.service.dep.DepService;

public class DepAction{

	@Autowired
	DepService depService;
	
	public String execute(){
		
		return "success";
	}
}
