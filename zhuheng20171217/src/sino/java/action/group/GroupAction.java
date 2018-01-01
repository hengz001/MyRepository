package sino.java.action.group;

import java.io.Serializable;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import sino.java.po.group.Group;
import sino.java.po.user.User;
import sino.java.service.group.GroupService;
import sino.java.service.group.GroupServiceFinder;
import sino.java.service.user.UserServiceFind;

public class GroupAction {
	@Autowired
	private GroupService gs;
	
	@Autowired
	private GroupServiceFinder gsf;
	
	@Autowired
	private UserServiceFind userFind;

	private Group grp = new Group();	
	
	private int g_id;
	
	private int u_id;
	
	//修改组
	public String updateGroup(){
		gs.updateGroup(u_id, g_id);
		return "updateGroup";
	}
	
	//
	public String openUpdateGroup(){
		HttpServletRequest request = ServletActionContext.getRequest();
		List<Group> groups = gsf.findAll(Group.class, 
				"FROM Group g WHERE g.flag=1");
		 User user = userFind.findById(User.class, u_id);
		 request.setAttribute("groups", groups);
		 request.setAttribute("user", user);
		return "openUpdateGroup";
	}
	
	public String execute(){
		HttpServletRequest request = ServletActionContext.getRequest();
		
		List<Group> groups = gsf.findAll(Group.class, 
				"FROM Group g WHERE g.flag=1");
		List<User> users = userFind.findAll(User.class, 
				"FROM User u WHERE u.flag=1");
		
		request.setAttribute("groups", groups);
		request.setAttribute("users", users);
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
	
	//删除组
	public String deleteGrp(){
		gs.deleteByLogic(Group.class, new Serializable[]{g_id}, "g_id", "flag");
		return "deleteGrp";
	}
	
	public Group getGrp() {
		return grp;
	}

	public void setGrp(Group grp) {
		this.grp = grp;
	}

	public int getG_id() {
		return g_id;
	}

	public void setG_id(int g_id) {
		this.g_id = g_id;
	}	
	
	public int getU_id() {
		return u_id;
	}

	public void setU_id(int u_id) {
		this.u_id = u_id;
	}

}
