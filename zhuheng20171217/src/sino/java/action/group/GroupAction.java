package sino.java.action.group;

import org.springframework.beans.factory.annotation.Autowired;

import sino.java.po.group.Group;
import sino.java.service.group.GroupService;
import sino.java.service.group.GroupServiceFinder;

public class GroupAction {
	@Autowired
	private GroupService gs;
	@Autowired
	private GroupServiceFinder gsf;

	private Group grp = new Group();	
	
	public String execute(){
		
		return "index";
	}
	
	//显示添加组
	public String showAddGrp(){
		
		return "showAddGrp";
	}
	
	//添加组
	public String addGrp(){
		grp.setFlag(1);
		gs.save(grp);
		return "addGrp";
	}

	public Group getGrp() {
		return grp;
	}

	public void setGrp(Group grp) {
		this.grp = grp;
	}
}
