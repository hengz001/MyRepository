package sino.java.action.group;

import org.springframework.beans.factory.annotation.Autowired;
import sino.java.service.group.GroupService;
import sino.java.service.group.GroupServiceFinder;

public class GroupAction {
	@Autowired
	private GroupService gs;
	@Autowired
	private GroupServiceFinder gsf;

	public String execute(){
		
		return "index";
	}
}
