package sino.java.action.impower;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import sino.java.po.group.Group;
import sino.java.po.module.Module;
import sino.java.po.user.User;
import sino.java.service.group.GroupServiceFinder;
import sino.java.service.impower.ImpowerService;
import sino.java.service.impower.ImpowerServiceFinder;
import sino.java.service.mod.ModServiceFind;
import sino.java.service.user.UserServiceFind;

public class ImpowerAction {

	@Autowired
	private ImpowerService impowerService;
	
	@Autowired
	private ImpowerServiceFinder impowerFind;
	
	@Autowired
	private ModServiceFind modFind;
	
	@Autowired
	private GroupServiceFinder groupFind;
	
	@Autowired
	private UserServiceFind userFind;
	
	private int mainBodyId;
	
	private String mainBodyType;
	
	public String execute(){
		
		return "index";
	}
	
	public String showImpowerView(){
		HttpServletRequest request = ServletActionContext.getRequest();
		if(null!=mainBodyType){
			if("group".equals(mainBodyType)){
				Group group = groupFind.findById(Group.class, mainBodyId);
				request.setAttribute("group", group);
			}else if("user".equals(mainBodyType)){
				User user = userFind.findById(User.class, mainBodyId);
				request.setAttribute("user", user);
			}
		}
		List<Module> modules = modFind.findAll(Module.class, 
				"FROM Module m WHERE m.flag=1");
		request.setAttribute("modules", modules);
		return "showImpowerView";
	}

	public int getMainBodyId() {
		return mainBodyId;
	}

	public void setMainBodyId(int mainBodyId) {
		this.mainBodyId = mainBodyId;
	}

	public String getMainBodyType() {
		return mainBodyType;
	}

	public void setMainBodyType(String mainBodyType) {
		this.mainBodyType = mainBodyType;
	}
}
